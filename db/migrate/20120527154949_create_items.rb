class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.string :dimensions
      t.string :dating
      t.string :provenance
      t.string :signed
      t.float :price

      t.timestamps
    end
  end
end
