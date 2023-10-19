# frozen_string_literal: true

class Cart < ApplicationRecord
  # belongs_to :customer,  foreign_key: 'user_id'

  belongs_to :user
  has_many :cart_items, dependent: :destroy
  has_many :dishes, through: :cart_items

  validate :customer_only_add_restaurent

  def check_unique_restaurent?(restaurent)
    r_id = restaurent.category.restaurent_id
    cart_items.each do |cart_item|
      return true if cart_item.dish.category.restaurent_id != r_id
    end
    false
  end

  private

  def customer_only_add_restaurent
    return if user.type == 'Customer'

    errors.add(:base, 'Only Customer have permission to add Dishes.')
  end
end
