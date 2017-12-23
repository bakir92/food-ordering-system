class SessionsController < ApplicationController
	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			session[:user_id] = user.id
			session[:order_id] = current_order.id
			flash[:success] = 'You have successfully logged in'
			redirect_to user_path(user)
		else
			flash.now[:danger] = 'There was something wrong with your login information'
			render 'new'
		end
	end

	def destroy
		session[:user_id] = nil
		session[:order_id] = nil
		flash[:success] = 'You have successfully logged out'
		redirect_to root_path
	end
end