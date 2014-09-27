class RemoveCustomerIdToRecipes < ActiveRecord::Migration
  def change
    remove_column :recipes, :customer_id, :integer
  end
end
