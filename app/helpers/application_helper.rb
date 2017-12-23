module ApplicationHelper
	def gravatar_for(user, options = {size: 80})
		gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
		size = options[:size]
		gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
		image_tag(gravatar_url, alt: user.username, class: 'img-circle')
	end

	# def find_or_create_order
	# 	if session[:order_id]
	#       Order.find(session[:order_id])
	#     elsif current_user
	#       order = Order.create(user_id: current_user.id)
	#       session[:order_id] = order.id
	#       order
	#     else
	#       order = Order.create()
	#       session[:order_id] = order.id
	#       order
	#     end
	# end

	def current_order
	    if !session[:order_id].nil?
			Order.find(session[:order_id])
		elsif current_user
			Order.new(user_id: session[:user_id])
		else
			Order.new
		end
	end
end