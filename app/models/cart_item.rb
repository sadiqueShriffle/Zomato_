class CartItem < ApplicationRecord
	belongs_to :cart 
	belongs_to :dish
	belongs_to :order, optional: true
	
	validates :quantity, numericality: {greater_than: 0}

	def self.ransackable_attributes(auth_object = nil)
    ["cart_id", "created_at", "dish_id", "id", "quantity", "updated_at"]
  end
	def self.ransackable_associations(auth_object = nil)
    ["cart", "dish", "order"]
  end
end
