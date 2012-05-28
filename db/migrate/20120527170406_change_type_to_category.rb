class ChangeTypeToCategory < ActiveRecord::Migration
  def up
    rename_column :collections, :type, :category
  end

  def down
    rename_column :collections, :category, :type
  end
end
