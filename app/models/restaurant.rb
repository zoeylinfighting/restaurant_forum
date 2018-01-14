class Restaurant < ApplicationRecord
  mount_uploader :image, PhotoUploader
  validates_presence_of :name
  belongs_to :category
  default_scope { order(updated_at: :desc) }

  # 當Restaurant物件被刪除時，順便刪除內部的comment
  has_many :comments, dependent: :destroy
end
