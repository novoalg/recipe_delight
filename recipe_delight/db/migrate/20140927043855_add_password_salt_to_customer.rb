class AddPasswordSaltToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :password_salt, :string
    add_column :customers, :password_hash, :string
  end
end
