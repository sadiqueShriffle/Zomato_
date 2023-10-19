# frozen_string_literal: true

FactoryBot.define do
  factory :order_item do
    # quantity {"5"}
    dish
    order
  end
end
