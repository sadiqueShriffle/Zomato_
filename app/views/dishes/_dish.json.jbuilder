json.extract! dish, :id, :name, :price, :dish_type, :created_at, :updated_at
json.url dish_url(dish, format: :json)
