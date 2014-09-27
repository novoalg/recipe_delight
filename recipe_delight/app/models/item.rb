class Item < ActiveRecord::Base

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

    validates_presence_of :name
    validates_presence_of :price
    validates_presence_of :barcode
    validates_presence_of :store_id
    validates_presence_of :unit
    validates_presence_of :available

    scope :having_name, lambda { |name| where("name like '#{name}%'") }

end
