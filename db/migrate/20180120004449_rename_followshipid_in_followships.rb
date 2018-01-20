class RenameFollowshipidInFollowships < ActiveRecord::Migration[5.1]
  def change
    rename_column :followships, :followships_id, :following_id
  end
end
