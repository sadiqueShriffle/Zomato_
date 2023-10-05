ActiveAdmin.register Restaurent do
  # includes :categories, :dishes
  permit_params(:name,:place, :status)


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


end
