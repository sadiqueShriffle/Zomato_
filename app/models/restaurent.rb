class Restaurent < ApplicationRecord
	belongs_to :user
	has_many :categories , dependent: :destroy
	has_many :dishes, through: :categories
	accepts_nested_attributes_for :categories, allow_destroy: true
	before_save :remove_space

	enum status: {open: 'open',close: 'close'}

	validates :name, :place,:status,  presence: true
	validate :owner_only_add_restaurent


  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "name", "place", "status", "updated_at", "user_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["categories", "dishes", "user"]
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
