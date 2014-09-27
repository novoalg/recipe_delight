class AddCustomerIdToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :customer_id, :integer
  end
end
