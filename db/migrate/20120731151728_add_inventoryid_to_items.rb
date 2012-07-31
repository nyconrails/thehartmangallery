class AddInventoryidToItems < ActiveRecord::Migration
  def change
    add_column :items, :inventoryid, :string
  end
end
