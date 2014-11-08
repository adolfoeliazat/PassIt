class CreateItemRequests < ActiveRecord::Migration
  def change
    create_table :item_requests do |t|
      t.integer :item_id
      t.integer :user_id
      t.date :fromDate
      t.date :toDate
      t.text :description
      t.decimal :price, precision:8, scale:2

      t.timestamps
    end
  end
end
