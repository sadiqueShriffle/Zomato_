# frozen_string_literal: true

ActiveAdmin.register Restaurent do
  # includes :categories, :dishes
  menu priority: 2
  permit_params(:name, :place, :status)

  index do
    # column :profile do |dish|
    #   image_tag(dish.image, size: "50x40") if dish.image.present?
    # end
    column :name
    column :place
    column :status
    column :user
    column :created_at
    column :updated_at
    actions
  end

  # controller do
  #   def update
  #    # You can put your send email code over here
  #    super do |success, failure|
  #      block.call(success, failure) if block
  #      failure.html { render :edit }
  #    end

  #   end

  # end
end
