# frozen_string_literal: true

class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :dishes

  belongs_to :dishes
end
