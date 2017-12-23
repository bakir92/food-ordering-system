class Order < ApplicationRecord
	before_save :set_subtotal
	before_save :set_total_order_amount
	before_save :set_tax
	before_save :set_delivery
	has_many :order_items

	def subtotal
		order_items.collect { |order_item| order_item.valid? ? (order_item.unit_price*order_item.quantity) : 0 }.sum
	end

	def total_order_amount
		tax = 0.2
		delivery = 200
		self[:total_order_amount] = subtotal + (tax * (delivery + subtotal))
	end
	
	def tax
		self[:tax] = 0.5
	end

	def delivery
		self[:delivery] = 200
	end

	private 	
		
		def set_subtotal
			self[:subtotal] = subtotal
		end
		
		def set_tax
			self[:tax] = tax
		end
		
		def set_delivery
			self[:delivery] = delivery
		end
		
		def set_total_order_amount
			self[:total_order_amount] = total_order_amount

		end
end