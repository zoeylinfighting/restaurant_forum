class Category < ApplicationRecord
  
  # 如果分類下已有餐廳，就不允許刪除分類（刪除時會拋出Error）
  has_many :restaurants, dependent: :restrict_with_error

  validates_presence_of :name
end
