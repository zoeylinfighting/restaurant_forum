class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader

  has_many :comments
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
