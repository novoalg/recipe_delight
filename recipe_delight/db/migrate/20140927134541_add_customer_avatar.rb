class AddCustomerAvatar < ActiveRecord::Migration
  def change
		add_attachment :customers, :avatar
	 end
end
