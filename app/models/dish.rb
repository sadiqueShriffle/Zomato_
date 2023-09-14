class Dish < ApplicationRecord
	belongs_to :category
	belongs_to :restaurent
	has_many :cart_items , dependent: :destroy
	has_many :order_items,dependent: :destroy
	has_many_attached :images , dependent: :destroy

	enum dish_type: {veg: 'veg',nonveg: 'nonveg'}

	validates :name,:dish_type ,presence: true

	before_save :remove_space

	private
	def remove_space
    self.name = name.strip()
  end

end
