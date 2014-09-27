class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.float :price
      t.string :barcode
      t.integer :store_id
      t.string :unit
      t.boolean :available

      t.timestamps
    end
  end
end
