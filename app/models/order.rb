class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy
	has_many :dishes , through: :order_items


  # after_create :create_order_mail

  # def create_order_mail
  #   OrderMailer.with(user: self).welcome_email.deliver
  # end

  before_create :generate_order_id,:calculate_total_amount

  def generate_order_id
    o_id = SecureRandom.hex(7)
    self.unique_order_id=o_id
  end


  def calculate_total_amount
		self.total_amount = self.user.cart.cart_items.sum{|cart_item| cart_item.dish.price * cart_item.quantity}
  end


end

