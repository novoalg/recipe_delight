class CreateShoppingCarts < ActiveRecord::Migration
  def change
    create_table :shopping_carts do |t|
      t.string :stripe_customer_token

      t.timestamps
    end
  end
end
