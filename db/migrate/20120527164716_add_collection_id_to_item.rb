class AddCollectionIdToItem < ActiveRecord::Migration
  def change
    add_column :items, :collection_id, :integer

  end
end
