# frozen_string_literal: true

ActiveAdmin.register Dish do
  permit_params(:name, :dish_type, :image)

  menu priority: 4

  filter :name

  index do
    column :profile do |dish|
      image_tag(dish.image, size: '60x40') if dish.image.present?
    end
    column :name
    column :dish_type
    column :price
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :dish_type
      f.input :price
      f.input :category_id
      f.semantic_errors :category
      f.input :dish_image
      f.actions
    end
  end

  show do
    attributes_table do
      row :name
      row :dish_type
      row :price
      row :image do |ad|
        image_tag ad.image.url, width: 150, height: 120
      end
    end
  end
end
