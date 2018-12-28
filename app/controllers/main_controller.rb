class MainController < ApplicationController
	skip_before_action :authorize
	def index
		@products = Product.all.order("created_at DESC")
		@user = current_user
		@cart = current_cart
		@users = User.all
	end
end
