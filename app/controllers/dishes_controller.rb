# frozen_string_literal: true

class DishesController < ApplicationController
  def index
    @dishes = if params[:name].present? && params[:restaurent_id].present?
                filter_by_category
              elsif params[:name].present?
                search_by_name
              elsif params[:restaurent_id].present?
                search_by_restaurent_id
              elsif params[:category_id].present?
                Category.find(params[:category_id]).dishes
              elsif current_user.customer?
                Dish.all
              else
                current_user.dishes
              end
    @dishes = @dishes.paginate(page: params[:page], per_page: 2)
    # render json: @dish.paginate(page: params[:page], per_page: 2)
  end

  def new
    # @category = Category.new
    # @restaurent = Restaurent.find(params[:restaurent_id])
    @dish = Dish.new
    @category = Category.find(params[:category_id])
  end

  def show
    @dish = Dish.find(params[:id])
  end

  def edit; end

  def create
    # @category = Restaurent.find(params[:restaurent_id]).categories.new(category_params)
    @dish = Category.find(params[:category_id]).dishes.new(dish_params)
    return unless @dish.save

    redirect_to category_dishes_path(@dish.category_id)
  end

  def update
    @dish.update(dish_params)
    # @dish = current_user.dishes.find(params[:dish_id]).update(dish_params)
    # render json: "Dish Updated Successfully", status:200
  end

  def destroy
    if @dish.destroy
      redirect_to category_dishes_path(@dish.category_id)
    else
      format.html { render :new, status: :unprocessable_entity }
    end
  end

  private

  def search_by_restaurent_id
    restaurent_id = params[:restaurent_id]
    return render json: 'Empty Restaurent ID' unless restaurent_id.present?

    Restaurent.find(restaurent_id).dishes
  end

  def filter_by_category
    if current_user.owner?
      owner_dish = current_user.categories.where('categories.name ILIKE ?', "%#{params[:name].strip}%")
      return owner_dish
    end
    Category.where('name ILIKE ?', "%#{params[:name].strip}%")
    customer_dish
  end

  def owner_dish
    current_user.dishes.where('dishes.name ILIKE ?', "%#{params[:name].strip}%")
  end

  def customer_dish
    Dish.where('dishes.name ILIKE ?', "%#{params[:name].strip}%")
  end

  def dish_params
    params.permit(:name, :price, :dish_type, :image)
  end

  # def set_value
  #   @dish = Dish.find(params[:id])
  # end

  def set_value
    @dish = if current_user.owner?
              current_user.dishes.find(params[:id])
            else
              Dish.find(params[:id])
            end
  end
end
