class Order < ApplicationRecord
	has_many :line_items, dependent: :destroy
	belongs_to :user
	belongs_to :box


	has_many :products, through: :line_items

	STATUS = ["Complete", "Incomplete"]
	validates :order_status, inclusion: STATUS


	def total_price
		line_items.to_a.sum{|item| item.product.price}
	end

	def total_calories
		line_items.to_a.sum{|item| item.product.calories}
	end

	def total_proteins
		line_items.to_a.sum{|item| item.product.proteins}
	end

	def total_carbs
		line_items.to_a.sum{|item| item.product.carbs}
	end

	def total_water
		line_items.to_a.sum{|item| item.product.water}
	end

	def total_land
		line_items.to_a.sum{|item| item.product.land}
	end

	def total_carbon
		line_items.to_a.sum{|item| item.product.carbon}
	end

	def total_lives
		line_items.to_a.sum{|item| item.product.lives}
	end
end
