# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :set_order, only: %i[show update destroy]

  def index
    @orders = current_user.orders.includes(:order_items)
    @orders = @orders.paginate(page: params[:page], per_page: 2)
  end

  def new
    @order = Order.new
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

  def create
    @order = current_user.orders.new(order_item_params)
    current_user.cart_items.each do |cart_item|
      @order.order_items.new(dish_id: cart_item.dish_id, quantity: cart_item.quantity)
    end
    if @order.save
      # OrderMailer.with(user: current_user).welcome_email.deliver
      current_user.cart.cart_items.destroy_all
      flash[:notice] = 'Order Created Successfully'

      redirect_to orders_path
    else
      # flash[:alert] = "Please Add Items to place Order please"
      redirect_to orders_path, notice: 'Please Add Items to place Order'
      # render json: order.errors, status: :unprocessable_entity
    end
  end

  def update
    if @order.update(order_params)
      render json: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @order.destroy
    redirect_to orders_path
  end

  private

  def set_order
    @order = current_user.orders.find(params[:id])
  end

  def order_item_params
    params.require(:order).permit(:name, :shipping_address, :total_amount)
  end
end
