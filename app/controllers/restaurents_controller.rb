# frozen_string_literal: true

class RestaurentsController < ApplicationController
  before_action :set_values, only: %i[show update destroy edit]

  def index
    if current_user.owner?
      @restaurents = current_user.restaurents
      flash.now[:notice] = "We have exactly #{@restaurents.size} Restaurent available."
    else
      @restaurents = Restaurent.where(status: 'open')
    end
    @restaurents = @restaurents.paginate(page: params[:page], per_page: 2)
  end

  def new
    @restaurent = current_user.restaurents.new
    @restaurent.categories.new
    @restaurent.categories.each { |category| category.dishes.new }
  end

  def show
    @restaurent = if current_user.owner?
                    current_user.restaurents.includes(categories: :dishes).find(params[:id])
                  else
                    Restaurent.find(params[:id])
                  end
  end

  def create
    @restaurent = current_user.restaurents.new(restaurent_params)
    if @restaurent.save
      redirect_to root_path, status: :created
    else
      render :new
      render json: 'Error While Creating Restaurent', status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @restaurent.update(restaurent_params)
        format.html { redirect_to root_url, notice: 'Restaurent was successfully updated.' }
        format.json { render :show, status: :ok, location: @restaurent }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @restaurent.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @restaurent.destroy
      redirect_to root_path
    else
      @restaurent
    end
  end

  def search_restaurent
    restaurent = Restaurent.where('name like ?', "%#{params[:name].strip}%")
    return render json: restaurent unless restaurent.empty?

    render json: { error: 'No such restaurent found... ' }, status: 404
  end

  private

  def restaurent_params
    params.require(:restaurent).permit(
      :name,
      :place,
      :status,
      categories_attributes: [
        :id,
        :name,
        { dishes_attributes: %i[
          id
          name
          price
          dish_type
        ] }
      ]
    )
  end

  def set_values
    @restaurent = Restaurent.find(params[:id])
  end
end
