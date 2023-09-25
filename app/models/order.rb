class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy
	has_many :dishes , through: :order_items


  # after_create :create_order_mail

  # def create_order_mail
  #   OrderMailer.with(user: self).welcome_email.deliver
  # end
  before_create :generate_order_id

  def generate_order_id
    o_id = SecureRandom.hex(7)
    self.unique_order_id=o_id
  end

end

