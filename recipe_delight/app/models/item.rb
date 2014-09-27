class Item < ActiveRecord::Base

    validates_presence_of :name
    validates_presence_of :price
    validates_presence_of :barcode
    validates_presence_of :store_id
    validates_presence_of :unit
    validates_presence_of :available

end
