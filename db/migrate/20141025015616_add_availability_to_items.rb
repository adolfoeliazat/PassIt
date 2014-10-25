class AddAvailabilityToItems < ActiveRecord::Migration
  def change
    add_column :items, :availability, :string, default: "Available"
  end
end
