class Category < ActiveRecord::Base
	has_many :items
	has_many :category_items, through: :items
	validates :name, presence: true, uniqueness: true, length: {minimum: 3, maximum: 25}
end