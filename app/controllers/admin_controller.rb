class AdminController < ApplicationController
  before_action :verify_admin
  def index
    @users = User.all
    @restaurants = Restaurant.all
    @menus = Menu.all
    @dishes = Dish.all
  end

  private

  def verify_admin
    redirect_to root_path, alert: "Acesso Negado" unless current_user&.admin?
  end
end
