class Dish < ApplicationRecord
	belongs_to :category

	has_many :cart_items , dependent: :destroy
	has_many :order_items,dependent: :destroy
	
	# has_many_attached :images , dependent: :destroy
	has_one_attached :image , dependent: :destroy

	enum dish_type: {veg: 'veg',nonveg: 'nonveg'}

	validates :name,:dish_type ,presence: true

	before_save :remove_space


  # def self.ransackable_attributes(auth_object = nil)
  #   ["category_id", "created_at", "dish_type", "id", "name", "price", "updated_at"]
  # end

	# def self.ransackable_associations(auth_object = nil)
  #   ["cart_items", "category", "image_attachment", "image_blob", "order_items"]
  # end


 	def image_url
		Rails.application.routes.url_helpers.rails_blob_url(self.image, only_path: true)
 	end
 
	private
	def remove_space
    self.name = name.strip()
  end

end
