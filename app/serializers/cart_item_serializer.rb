# frozen_string_literal: true

class CartItemSerializer < ActiveModel::Serializer
  attributes :id

  has_many :dishes
end
