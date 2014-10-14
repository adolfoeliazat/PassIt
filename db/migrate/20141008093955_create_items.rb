class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.string :image
      t.decimal :price
      t.string :keywords
      t.integer :category_id
      t.integer :owner_id

      t.timestamps
    end
  end
end
