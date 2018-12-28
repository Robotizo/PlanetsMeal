class Cart < ApplicationRecord
	has_many :line_items, dependent: :destroy 
	has_many :products, through: :line_items

	def remove(product_id)
		current_item = line_items.find_by_product_id(product_id)
		if current_item
			current_item.delete
		end
		current_item
	end




	def removeNotSame
		self.products.each_with_index do |prod|
			unless self.products.first.try(:store_type) == prod.try(:store_type)
				self.destroy
			end
		end
	end






	def total_price
		line_items.to_a.sum{|item| item.product.price}
	end
end
