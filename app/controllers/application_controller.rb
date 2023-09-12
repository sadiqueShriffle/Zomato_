class ApplicationController < ActionController::Base
  include JwtToken
  
  before_action :authenticate_user!

  protect_from_forgery prepend: true
  # before_action :check_customer, except: :login
  # before_action :check_owner, except: :login


  rescue_from ActiveRecord::RecordNotFound, with: :handle_exception
  # rescue_from NoMethodError, with: :handle_pram_exception

  before_action do
    ActiveStorage::Current.url_options = { protocol: request.protocol, host: request.host, port: request.port }
  end

    # def login
    # @user = User.find_by(email: params[:email])
    #   if @user&.authenticate(params[:password])
    #     session[:current_user]= jwt_encode({user_id: @user.id})
    #     byebug
    #   else
    #     render json: { error: 'Unauthorized' }, status: :unauthorized
    #   end
    # end


  # def logout
  #   session.delete(:current_user)
  #   @current_user =nil
  # end


  private
  # def authenticate_user
  #   header = request.headers['Authorization']
  #   header = header.split(' ').last if header
  #   begin
  #     decoded = jwt_decode(header)
  #     @current_user = User.find(decoded[:user_id])
  #   rescue JWT::DecodeError => e
  #     render json: { error: e.message }, status: :unauthorized
  #   end
  # end



  def owner_check
    unless @current_user.owner?
      render json: {error: 'Owner not found..'}
    end
  end

  def customer_check
    unless @current_user.customer?
      render json: {error: 'Customer not found..'}
    end
  end


  def handle_exception
    render json: { error: 'Invalid Id ' }, status:404
  end

  # def handle_pram_exception
  #   render json: {error: 'Param is missing or Empty Value'}, status:406
  # end

end

  # def authenticate_user
  #   header = request.headers['Authorization']
  #   header = header.split(' ').last if header
  #   begin
  #     @decoded = jwt_decode(header)
  #     @current_user = User.find(@decoded[:user_id])
  #   rescue ActiveRecord::RecordNotFound => e
  #     render json: { error: "User not found" }, status: :unauthorized
  #   rescue JWT::DecodeError => e  
  #     render json: { error: "Login First" }, status: :unauthorized 
  #   end
  # end
