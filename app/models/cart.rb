class Cart < ApplicationRecord
	belongs_to :user
	has_many :cart_items, dependent: :destroy
	has_many :dishes, through: :cart_items

	validate :customer_only_add_restaurent

	def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "updated_at", "user_id"]
  end
	def self.ransackable_associations(auth_object = nil)
    ["cart_items", "dishes", "user"]
  end


	def check_unique_restaurent?(restaurent)
		r_id = restaurent.category.restaurent_id
		cart_items.each do |cart_item|
			if cart_item.dish.category.restaurent_id!=r_id
				return true
			else
				return false
			end
		end
	end

	
	private
	def customer_only_add_restaurent
		unless user.type == "Customer"
			errors.add(:base, "Only Customer have permission to add Dishes.")      
		end
	end


end
