# frozen_string_literal: true

ActiveAdmin.register CartItem do
  index do
    column :dish
    column :cart
    column :user
    column :quantity
    column :created_at
    column :updated_at
    actions
  end
end
