# frozen_string_literal: true

class CategoriesController < ApplicationController
  # before_action :owner_check, except: [:index,:show]
  # before_action :set_category, only: %i[ edit update destroy ]

  # GET /categories or /categories.json
  def index
    @categories = Restaurent.find(params[:restaurent_id]).categories
  end

  # GET /categories/1 or /categories/1.json
  def show
    @category = Category.find(params[:id])
  end

  # GET /categories/new
  def new
    @category = Category.new
    @restaurent = Restaurent.find(params[:restaurent_id])
  end

  # GET /categories/1/edit
  def edit; end

  # POST /categories or /categories.json
  def create
    @category = Restaurent.find(params[:restaurent_id]).categories.new(category_params)
    respond_to do |format|
      if @category.save
        # format.html { redirect_to category_url(@category), notice: "Category was successfully created." }
        format.html do
          redirect_to restaurent_categories_url(@category.restaurent_id), notice: 'Category was Successfully Created'
        end
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
        format.html { redirect_to category_url(@category), notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1 or /categories/1.json
  def destroy
    redirect_to restaurent_categories_path(@category.restaurent_id) if @category.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = if current_user.owner?
                  current_user.categories.find(params[:id])
                else
                  Category.find(params[:id])
                end
  end

  # Only allow a list of trusted parameters through.
  def category_params
    params.call(:category).permit([:name])
  end
end
