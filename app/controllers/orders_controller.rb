class OrdersController < ApplicationController
	before_action :require_same_user, only: [:show, :update]
	
	def index
	    if !current_user
	      flash.notice = 'You need to sign in to view past orders'
	      redirect_to login_path
	    elsif !current_user.admin?
	      flash[:success] = "Viewing order for #{current_user.username}"
	      @orders = current_user.orders.where(user_id: session[:user_id])
	    else
	      flash[:success] = "Viewing order for #{current_user.username}"	
	      @orders = Order.all
	    end
	end
	def show
		@orders = current_order
	end

	def edit
		@order = Order.find(session[:order_id])
	end

	def update
		@order = current_order
		if @order.update(order_params)
			flash[:success] = "Order Successfully Updated"
			redirect_to carts_path
		else
			Order.new
		end
	end

	def destroy
		@order = Order.find(params[:id])
		@order.destroy
		flash[:danger] = "Order was successfully deleted"
		redirect_to orders_path
	end

	def checkout
	    if session[:user_id]
	      @order = current_order
	      @order.update(user_id: current_user.id, total_order_amount: current_order.total_order_amount, subtotal: current_order.subtotal)
	      flash[:notice] = "Order Completed"
	      session[:order_id] = nil
	      redirect_to root_path
	    else
	      flash.notice = "You need to log in first!"
	      redirect_to login_path
	    end
	end

	private
		def order_params
			params.require(:order).permit(:order_id,:total_order_amount,:subtotal,:user_id)
		end

		def require_same_user
			if current_user != @order.user && !current_user.admin?
				flash[:danger] = 'You can only view your own order'
				redirect_to root_path

			end
		end
end