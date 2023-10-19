# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :type, :image

  def image
    object.image.url
  end
end
