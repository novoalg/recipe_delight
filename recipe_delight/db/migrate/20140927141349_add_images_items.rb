class AddImagesItems < ActiveRecord::Migration
  def change
		add_attachment :items, :image
	  add_attachment :coupons, :image
		add_attachment :recipes, :image
	end
end
