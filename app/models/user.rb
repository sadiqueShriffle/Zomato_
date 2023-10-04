class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

	has_many :restaurents , dependent: :destroy
	has_many :orders  , dependent: :destroy
	has_one  :cart , dependent: :destroy
	has_many :categories, through: :restaurents
	has_many :dishes, through: :categories
	has_many :cart_items, through: :cart
	has_many :order_items, through: :orders
	has_one_attached :image, dependent: :destroy

	
	before_save :remove_space

	validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message:"Invalid email id!!!!" }


	# def self.ransackable_attributes(auth_object = nil)
  #   ["created_at", "email", "encrypted_password", "id", "name", "remember_created_at", "reset_password_sent_at", "reset_password_token", "type", "updated_at"]
  # end


  # def self.ransackable_associations(auth_object = nil)
  #   ["cart", "cart_items", "categories", "dishes", "image_attachment", "image_blob", "order_items", "orders", "restaurents"]
  # end
	

	def remove_space
    self.name = name.strip()
		self.email = email.strip()
  end

	def owner?
		type == "Owner" 
	end
	def customer?
		type == "Customer"
	end

end
