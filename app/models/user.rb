class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader

  # 如果User已經有了評論，就不允許刪除帳號（刪除時拋出Error）
  has_many :comments, dependent: :restrict_with_error
  has_many :restaurants, through: :comments

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
