class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy
	has_many :dishes , through: :order_items

  after_create :create_order_mail

  def create_order_mail
    OrderMailer.with(user: self).welcome_email.deliver
  end
end

