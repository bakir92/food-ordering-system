class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
    	t.string :item_name
    	t.string :description
    	t.float :price
    	t.integer :category_id
    	t.timestamps
    end
  end
end
