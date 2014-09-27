class RenamePasswordSaltFromCustomer < ActiveRecord::Migration
  def change
    rename_column :customers, :password_salt, :password_digest
  end
end
