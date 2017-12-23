class CreateOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_items do |t|
    	t.float :total_item_price
    	t.integer :quantity
    	t.integer :item_id
    	t.integer :order_id
    	t.timestamps
    end
  end
end
