# frozen_string_literal: true

class UsersController < ApplicationController
  # before_action :set_user

  def show
    @user = current_user
  end

  def create
    user = User.new(user_param)
    return render json: user if user.save

    render json: user.errors.full_messages
  end

  def edit
    # @user =current_user
  end

  def update
    return unless current_user.update(user_param)

    redirect_to user_path
  end

  def destroy
    return render json: { message: 'User Deleted Successfully' } if current_user.destroy

    render json: { errors: current_user.errors.full_messages }
  end

  private

  def user_param
    params.require(:user).permit(:name, :email, :password, :type, :image)
  end

  def set_user
    @user = current_user
  end
end
