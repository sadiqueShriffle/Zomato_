class Category < ApplicationRecord
	has_many :dishes , dependent: :destroy
	validates :name, presence: true
	accepts_nested_attributes_for :dishes, allow_destroy: true

	before_save :remove_space

	# def self.ransackable_attributes(auth_object = nil)
  #   ["created_at", "id", "name", "restaurent_id", "updated_at"]
  # end

	# def self.ransackable_associations(auth_object = nil)
  #   ["dishes"]
  # end

	private
	def remove_space
    self.name = name.strip()
  end

end
