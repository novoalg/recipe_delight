class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.date :dob
      t.string :gender
      t.string :phone
      t.string :location
      t.integer :store_id
      t.string :email

      t.timestamps
    end
  end
end
