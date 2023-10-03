class Dish < ApplicationRecord
	belongs_to :category

	has_many :cart_items , dependent: :destroy
	has_many :order_items,dependent: :destroy
	
	# has_many_attached :images , dependent: :destroy
	has_one_attached :image , dependent: :destroy

	enum dish_type: {veg: 'veg',nonveg: 'nonveg'}

	validates :name,:dish_type ,presence: true

	before_save :remove_space

	def image_url
		Rails.application.routes.url_helpers.rails_blob_url(self.image, only_path: true)
 end

	private
	def remove_space
    self.name = name.strip()
  end

end
