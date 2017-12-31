class Restaurant < ApplicationRecord
  mount_uploader :image, PhotoUploader
  validates_presence_of :name
  belongs_to :category
  default_scope { order(updated_at: :desc) }
  has_many :comments
end
