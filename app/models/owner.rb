# frozen_string_literal: true

class Owner < User
  # has_many :restaurents ,foregin_key: :owner_id, dependent: :destroy
  # has_many :categories, through: :restaurents
  # has_many :dishes, through: :categories
end
