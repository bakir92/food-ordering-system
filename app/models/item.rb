class Item < ApplicationRecord
	belongs_to :category
	has_many :order_items
	validates :item_name, presence: true, length: {minimum: 3, maximum: 50}
	validates :description, presence: true, length: {minimum: 10, maximum: 300}
	validates :price, presence: true
	validates :category_id, presence: true
end