class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.integer :item_id
      t.integer :discount
      t.integer :store_id
      t.string :barcode
      t.date :active_date
      t.date :deactivate_date

      t.timestamps
    end
  end
end
