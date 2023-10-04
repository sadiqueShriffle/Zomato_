ActiveAdmin.register Dish do

  filter :name

  form do |f|
    f.inputs do
      # attributes_names return array of key
      # f.semantic_errors *f.object.errors.attribute_names
      f.input :dish_name
      f.input :category_id
      f.semantic_errors :category
      f.input :dish_images, as: :file, input_html: { multiple: true }
    end
    f.actions
  end

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
