class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :location
      t.string :hours
      t.string :phone

      t.timestamps
    end
  end
end
