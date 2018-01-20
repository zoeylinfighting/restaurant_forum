class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader

  # 如果User已經有了評論，就不允許刪除帳號（刪除時拋出Error）
  has_many :comments, dependent: :restrict_with_error
  has_many :restaurants, through: :comments

  # 【使用者收藏很多餐廳】的多對多關聯
  # 使用dependent: :destroy-當user被刪除時,相關的favorite物件也會一併被刪除
  has_many :favorites, dependent: :destroy
  has_many :favorited_restaurants, through: :favorites, source: :restaurant

  # 「使用者對很多餐廳按讚」的多對多關係
  has_many :likes, dependent: :destroy
  has_many :liked_restaurants, through: :likes, source: :restaurant

  # 「使用者的追蹤使用者」的self-referential relationships設定
  # 不需要另加source,Rails可從Followship Model設定來判斷follwings指向User Model
  has_many :followships, dependent: :destroy
  has_many :followings, though: :followships

  before_save :initialize_name

  def admin?
    self.role == "admin"
  end

  def initialize_name
    if self.name == ""
      self.name = self.email.split('@').first
    end
  end

end
