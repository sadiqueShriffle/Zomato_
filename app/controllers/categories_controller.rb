class CategoriesController < ApplicationController

  before_action :owner_check, except: [:index,:show]
  before_action :set_category, only: %i[ edit update destroy ]

  # GET /categories or /categories.json
  def index
    @categories = Restaurent.find(params[:restaurent_id]).categories
  end

  # GET /categories/1 or /categories/1.json
  def show
    @category= Category.find(params[:id])
  end

  # GET /categories/new
  def new
    rest = params[:restaurent_id]
    byebug
    @category = Restaurent.find(rest).categories.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories or /categories.json
  def create

    @category = Restaurent.find(rest).categories.new(category_params)
    respond_to do |format|
      if @category.save
        format.html { redirect_to category_url(@category), notice: "Category was successfully created." }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1 or /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to category_url(@category), notice: "Category was successfully updated." }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1 or /categories/1.json
  def destroy
    @category.destroy

    respond_to do |format|
      format.html { redirect_to categories_url, notice: "Category was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      if current_user.owner?
        @category = current_user.categories.find(params[:id])
      else
        @category = Category.find(params[:id])
      end
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:name)
    end

end