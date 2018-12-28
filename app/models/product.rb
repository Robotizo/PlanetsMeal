class Product < ApplicationRecord
	has_many :line_items
	before_destroy :ensure_not_referenced_by_any_line_item
	has_many :orders, through: :line_items, dependent: :destroy

	validates :price, numericality: {greater_than_or_equal_to: 0.01}
	validates :title, :description, presence: true
	validates_presence_of :calories
	mount_uploader :image, ImageUploader

	STORE_TYPES = ["Academy Corner Store", "Fusion Express"]
	validates :store_type, inclusion: STORE_TYPES

	has_one :box





	private
		def ensure_not_referenced_by_any_line_item
		 	if line_items.empty?
		 		return true
		 	else
		 		errors.add(:base, 'Line item present')
		 		return false
		 	end
		end

end
