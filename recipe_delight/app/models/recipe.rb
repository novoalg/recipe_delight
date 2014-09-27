class Recipe < ActiveRecord::Base

	def self.search(item)
			where(":name is like ?", "%#{item}%" )
	end

end
