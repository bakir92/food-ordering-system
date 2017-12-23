class WelcomeController < ApplicationController
	def home
		@items = Item.paginate(page: params[:page], per_page: 5)
		@order_item = current_order.order_items.new
	end

	def about
	end
end