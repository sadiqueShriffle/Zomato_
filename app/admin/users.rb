# frozen_string_literal: true

ActiveAdmin.register User do
  menu priority: 1

  permit_params(:name, :type, :email, :password, :password_confirmation)

  filter :name
  filter :email
  filter :type

  form do |f|
    f.inputs do
      f.input :type, as: :select, collection: %w[Owner Customer]
      f.input :name
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  index do
    # column :profile do |user|
    #   image_tag(user.profile_picture, size: "50x40") if user.profile_picture.present?
    # end
    column :type
    column :id
    column :name
    column :email
    column :created_at
    column :updated_at
    actions
  end

  show do |_user|
    attributes_table do
      row :type
      row :id
      row :name
      row :email
      row :created_at
      row :updated_at
    end
  end
end
