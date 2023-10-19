# frozen_string_literal: true

ActiveAdmin.register Category do
  menu priority: 3

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end
