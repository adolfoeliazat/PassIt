class AddStatusToItemrequest < ActiveRecord::Migration
  def change
    add_column :item_requests, :status, :string
  end
end
