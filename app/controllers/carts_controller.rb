class CartsController < ApplicationController
	def show
		if !logged_in?
			flash[:danger] = "You need to lgogin to view the cart"
			redirect_to login_path
		else
			@order_items = current_order.order_items
		end
	end

end