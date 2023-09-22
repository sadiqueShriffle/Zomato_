class CartsController < ApplicationController

  before_action :set_cart, only: [:index]
  before_action :set_cart_item ,only: %i[edit update destroy]

  # before_action :find_id ,only: %i[create]

  
  def index
    @carts = current_user.cart.cart_items
  end

  def show
    @cart_data = current_user.cart.cart_items.includes(:dish)
    @cart_items_data = @cart_data.map do |cart_item|
      {
        id: cart_item.id,
        dish: cart_item.dish.name,
        price: cart_item.dish.price,
        quantity: cart_item.quantity
      }
    end
      # render json: cart_items_data
  end
  
  def new
    id = params[:format].to_i
    @dish=Dish.find(id)
  end

  def create
    add_cart = current_user.cart.cart_items.new(cart_item_params)
    if add_cart.save
      flash[:notice] = "Item Added to your Cart."
      redirect_to carts_path
    end
  end


  def edit
  end

  def update
    @cart_item = current_user.cart.cart_items.find(params[:cart_item_id])
    if @cart_item.update(cart_item_params)
      render json: "Item Updated Successfully",status:200
    else
      render json: @cart_item.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @cart_item.destroy
      redirect_to root_path
    end
  end

  def clear_cart
    current_user.cart.cart_items.destroy_all
    redirect_to root_path
  end

  private

  def set_cart
    @cart=current_user.create_cart unless current_user.cart.present?  
  end

  def set_cart_item
    @cart_item = current_user.cart.cart_items.find(params[:id])
  end

  def cart_item_params
    params.permit(:dish_id, :quantity)
  end

end
