Rails.application.routes.draw  do

  devise_for :users

  root 'users#login '

  # User routes
  # post '/login', to: 'application#login'

  post "/signup", to: "users#create"
  resource :user,  except: :create

  # Restaurent routes
  get '/restaurent/search' , to: "restaurents#search"
  resources :restaurents 

  # Dish Routes
  resource :dishes
  get '/dish/search', to: 'dishes#search_dish'
  get '/category/search', to: 'dishes#filter_by_category'

  # Cart Routes
  post '/additems' , to: "carts#add_item"
  resource :cart

  # Orders Routes
  resources :orders
  
end
