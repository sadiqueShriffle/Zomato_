ActiveAdmin.register Category do

  filter :name

  index do
    column :id
    column :name
    # Not work as i expected PENDING
    column 'Dishes' do |category|
      category.dishes.count
    end
    actions
  end

  show do |category|
    attributes_table do
      row :id
      row :name
      row :created_at
      row :updated_at
      row :dishes_count do |category|
        category.dishes.count
      end
    end
  end

  permit_params(:name)
end
