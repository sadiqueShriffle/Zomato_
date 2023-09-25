class DishesController < ApplicationController  

  def index
    if params[:name].present? && params[:restaurent_id].present?
      @dishes = filter_by_category
    elsif params[:name].present?
      @dishes=search_by_name
    elsif params[:restaurent_id].present?
      @dishes=search_by_restaurent_id   
    elsif params[:category_id].present?
      @dishes=Category.find(params[:category_id]).dishes    
    else
      if current_user.customer?
        @dishes= Dish.all 
      else
        @dishes= current_user.dishes
      end
    end
      # render json: @dish.paginate(page: params[:page], per_page: 2)
  end

  def show
    @dish= Dish.find(params[:id])
  end
  
  def edit  
  end

  def new
    # @category = Category.new
    # @restaurent = Restaurent.find(params[:restaurent_id])
    @dish = Dish.new
    @category = Category.find(params[:category_id])
  end

  def create
    # @category = Restaurent.find(params[:restaurent_id]).categories.new(category_params)
    @dish = Category.find(params[:category_id]).dishes.new(dish_params)
    if @dish.save
      redirect_to category_dishes_path(@dish.category_id)
    end
  end

  def update
    byebug
    @dish = @dish.update(dish_params)
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
    restaurent=Restaurent.find(restaurent_id).dishes
    return restaurent
  end

  def filter_by_category
    if current_user.owner?
      owner_dish = current_user.categories.where("categories.name ILIKE ?", "%#{params[:name].strip}%")
      return owner_dish
    end
    custoemr_dish = Category.where("name ILIKE ?", "%#{params[:name].strip}%")
    return customer_dish
  end

  def owner_dish
    ow_dish= current_user.dishes.where("dishes.name ILIKE ?", "%#{params[:name].strip}%")
    return ow_dish 
  end

  def customer_dish
    cu_dish= Dish.where("dishes.name ILIKE ?", "%#{params[:name].strip}%")
    return cu_dish 
  end

  def dish_params
    params.permit(:name ,:price ,:dish_type, :image)
  end 

  # def set_value
  #   @dish = Dish.find(params[:id])
  # end
  
  def set_value
    if current_user.owner?
      @dish = current_user.dishes.find(params[:id])
    else
      @dish = Dish.find(params[:id])
    end
  end

end

