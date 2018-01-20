class Followship < ApplicationRecord
  # 「使用者的追蹤使用者」的self-referential relationships設定
  # 由於 :following指向User Model,Rails無法自動推論
  # 使用 :class_name告知對應Model名稱
  belongs_to :user
  belongs_to :following, class_name: "User"
end
