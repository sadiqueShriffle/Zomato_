# frozen_string_literal: true

class OrderitemsSerializer < ActiveModel::Serializer
  attributes :id, :dish_name, :dish_price

  def dish_name
    object.dish.name
  end

  def dish_price
    object.dish.price
  end
end
