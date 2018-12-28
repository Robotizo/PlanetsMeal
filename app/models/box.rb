class Box < ApplicationRecord
	belongs_to :product
	has_one :order
	belongs_to :user
	validates_presence_of :box_price
	validates_presence_of :product_id


	def set_box_price(attribute, by)
		self[attribute] ||= 0
	 	newval = self[attribute] += by
	  	update_attribute(attribute, newval)
	end

	
end
