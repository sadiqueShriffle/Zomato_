# frozen_string_literal: true

class Customer < User
  # has_one  :cart ,foregin_key: :customer_id, dependent: :destroy
  # has_many :cart_items, through: :cart
  # has_many :orders ,foregin_key: :customer_id, dependent: :destroy
  # has_many :order_items, through: :orders
end
