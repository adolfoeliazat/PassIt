class RenameOwnerIdInItems < ActiveRecord::Migration
  def change
    rename_column :items, :owner_id, :user_id
  end
end
