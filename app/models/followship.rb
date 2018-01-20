class Followship < ApplicationRecord
  # 確保特定user_id下,只能有一個followings_id
  validates :following_id, uniqueness: { scope: :user_id }

  # 「使用者的追蹤使用者」的self-referential relationships設定
  # 由於 :following指向User Model,Rails無法自動推論
  # 使用 :class_name告知對應Model名稱
  belongs_to :user
  belongs_to :following, class_name: "User"
end
