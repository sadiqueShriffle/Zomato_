json.extract! restaurent, :id, :name, :place, :status, :created_at, :updated_at
json.url restaurent_url(restaurent, format: :json)
