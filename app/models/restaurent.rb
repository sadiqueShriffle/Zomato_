class Restaurent < ApplicationRecord
	belongs_to :user
	has_many :categories , dependent: :destroy
	has_many :dishes, through: :categories
	accepts_nested_attributes_for :categories, allow_destroy: true
	before_save :remove_space,:test

	enum status: {open: 'open',close: 'close'}

	validates :name, :place,:status,  presence: true
	validate :owner_only_add_restaurent

	def test?(cateogy)
		byebug
		category=cateogy.id
		byebug
		c_id = find_by(:name)
	end

	# private
	def remove_space
		byebug
    self.name = name.strip()
		self.place = place.strip()
  end

	def owner_only_add_restaurent
		unless user.type == "Owner"
			errors.add(:base, "Only Owner have permission to add Restaurents.")      
		end
	end
	
end
