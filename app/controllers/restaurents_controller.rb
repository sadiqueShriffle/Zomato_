class RestaurentsController < ApplicationController

	before_action :customer_check , only: :search
	before_action :owner_check, except: [:index,:show]

	before_action :set_values , only: [:show,:update , :destroy] 

	def index
		if current_user.owner?
		 	@restaurents = current_user.restaurents
		else
			@restaurents = Restaurent.where(status: 'open')
		end
		@restaurens
		# .paginate(page: params[:page], per_page: 2)
	end

	def show 
		if current_user.owner?
			@restaurent = current_user.restaurents.includes(categories: :dishes).find(params[:id]) 
		else	
			@restaurent= Restaurent.find(params[:id])
		end
	end

	def new
		@restaurent = current_user.restaurents.new
		@restaurent.categories.new 
		@restaurent.categories.each {|category| category.dishes.new}
	end

	def create
		@restaurent = current_user.restaurents.new(restaurent_params)
		if @restaurent.save
			redirect_to root_path
		else
			render json: 'Error While Creating Restaurent', status: :unprocessable_entity
		end
	end

	def edit
		@restaurrent=@restaurent.update(restaurent_params)
	end

	def update
		return render json: {message: " Updated successfully!!", data:@restaurent}	if @restaurent.update(restaurent_params)
		render json: {errors: @restaurent.errors.full_messages}, status: :unprocessable_entity
	end

	def destroy
		if @restaurent.destroy
		# return render json: {message: " Restaurent Deleted successfully!!", data:@restaurent} 
		# render json: {errors: @restaurent.errors.full_messages}, status: :unprocessable_entity
	else
		@restaurent
	end
	end

	def search
    restaurent = Restaurent.where("name like ?","%" +params[:name].strip+ "%")
    return  render json: restaurent unless restaurent.empty?
    render json: {error: "No such restaurent found... "}, status:404            
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
						dishes_attributes: [
							:id, 
							:name,
							:price,
							:dish_type
						]
				]
		)
	end

	def set_values
		@restaurent = Restaurent.find(params[:id])
	end

end

