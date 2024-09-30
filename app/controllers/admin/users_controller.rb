# app/controllers/admin/users_controller.rb
class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_if_admin

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
    @restaurants = Restaurant.all
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_users_path, notice: 'User updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path, notice: 'User deleted successfully.'
  end

  def restaurant?
    @user.restaurant_id.present?
  end
  private

  def check_if_admin
    redirect_to root_path, alert: 'You are not authorized to access this page.' unless current_user.admin?
  end

  def user_params
    params.require(:user).permit(:email, :restaurant_id, :role)
  end
end
