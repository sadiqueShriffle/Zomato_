ActiveAdmin.register Dish do

  filter :name

  show do
    attributes_table do
      row :name 
      row :dish_type
      row :price
      row :image do |ad|
        image_tag ad.image.url,width:150,height:120
      end
    end
  end

end
