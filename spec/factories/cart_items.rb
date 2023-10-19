# frozen_string_literal: true

FactoryBot.define do
  factory :cart_item do
    quantity { '5' }
    dish
    cart
  end
end
