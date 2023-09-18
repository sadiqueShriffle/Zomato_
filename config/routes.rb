Rails.application.routes.draw  do

  devise_for :users

  root 'restaurents#index'

  # User routes
  # post '/login', to: 'application#login'

  # post "/signup", to: "users#create"
  resource :user,  except: :create

  # Restaurent routes
  get '/restaurent/search' , to: "restaurents#search"
  resources :restaurents 

  #Categories Routes
  resources :categories
    get '/categories/create/:id', to: 'categories#new'


  # Dish Routes
  resources :dishes
  # get '/dish/search', to: 'dishes#search_dish'
  # get '/category/search', to: 'dishes#filter_by_category'

  # Cart Routes
  post '/additems' , to: "carts#add_item"
  resource :cart

  # Orders Routes
  resources :orders
  
end
