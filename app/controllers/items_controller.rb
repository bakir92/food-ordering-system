class ItemsController < ApplicationController
	before_action :set_item, only: [:edit, :update, :show, :destroy] 
	before_action :require_user, except: [:index, :show]
	before_action :require_same_user, only: [:edit, :update, :destroy]

	def index
		@items = Item.paginate(page: params[:page], per_page: 5)
		@order_item = current_order.order_items.new
	end

	def new
		@item = Item.new
	end

	def edit
		
	end

	def update
		if @item.update(item_params)
			flash[:success] = "item was successfully updated."
			redirect_to item_path(@item)
		else
			render 'edit'
		end
	end

	def create
		@item = Item.new(item_params) 
		if @item.save
			flash[:success] = "item was successfully created."
			redirect_to item_path(@item)	
		else
			render 'new'
		end
		
	end

	def destroy
		@item.destroy
		flash[:danger] = "item was successfully deleted"
		redirect_to items_path
	end

	def show
		
	end		

	private
		def set_item
			@item = Item.find(params[:id])
		end

		def item_params
			params.require(:item).permit(:item_name, :description, :price, :category_id)
		end
		def require_same_user
			if !current_user.admin?
				flash[:danger] = 'You can only edit and delete your own item'
				redirect_to root_path

			end
		end
end
