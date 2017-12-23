class OrderItemsController < ApplicationController
  
  def create
    @order = current_order
    @order_item = @order.order_items.new(order_item_params)
    existingorder = @order.order_items.where(item_id: params[:order_item][:item_id])

    if existingorder.count >= 1
      existingorder.last.update_column(:quantity, existingorder.last.quantity + params[:order_item][:quantity].to_i)
    else
      @order.save
    end
    session[:order_id] = @order.id
    end

  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.update(order_item_params)
    @order_items = @order.order_items
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    session[:order_id] = ''
    @order_items = @order.order_items
  end

  private
    def order_item_params
      params.require(:order_item).permit(:item_id, :quantity)
    end

    
end