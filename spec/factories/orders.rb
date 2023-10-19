# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    name { 'Test' }
    shipping_address { '321, Azad Nagar indore' }
    total_amount { '120' }
    # unique_order_id {"0ac5e46f59260b"}
    user
  end
end
