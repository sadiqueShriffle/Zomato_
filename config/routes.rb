Rails.application.routes.draw  do

  devise_for :users

  root 'restaurents#index'

  # User routes
  # post '/login', to: 'application#login'

  # post "/signup", to: "users#create"
  # resource :user,  except: :create

  # Restaurent routes
  get '/restaurent/search' , to: "restaurents#search"
  resources :restaurents do 
    resources :categories ,shallow: true  do
      resources :dishes , shallow: true
    end
  end

  resources :categories, only: [:create]
  resources :dishes, only: [:create]
  # get '/categories/:restaurent_id' to: "categories#create"

  # resources :categories do
  #   resources :dishes , shallow: true
  # end

  # Dish Routes
  # resources :dishes
  # get '/dish/search', to: 'dishes#search_dish'
  # get '/category/search', to: 'dishes#filter_by_category'

  # Cart Routes
  # post '/add_to_cart' , to: "carts#add_item"
  resources  :carts
  get '/clearcart', to: "carts#clear_cart"

  # Orders Routes
  resources :orders
  
end
