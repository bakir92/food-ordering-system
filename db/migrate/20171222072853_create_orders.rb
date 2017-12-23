class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
    	t.float :total_order_amount
    	t.integer :user_id
    	t.string :status, default: "Pending"
    	t.timestamps
    end
  end
end
