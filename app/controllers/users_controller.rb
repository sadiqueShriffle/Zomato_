class UsersController < ApplicationController
  
  def show
    @user = current_user
  end

  def create
    user = User.new(user_param)
    if user.save
      UserMailer.with(user: user).welcome_email.deliver
      return render json: user
    end
    render json: user.errors.full_messages
  end
  
  def edit
    @user =current_user
    byebug
  end

  def update
    byebug
    if @user.update(user_param)
    end
  end

  def destroy
    return render json: {message: 'User Deleted Successfully'} if current_user.destroy
    render json: {errors: current_user.errors.full_messages}
  end

  private
  def user_param
    params.require(:user).permit(:name,:email,:password,:type,:image)
  end

end