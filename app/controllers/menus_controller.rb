class MenusController < ApplicationController
  before_action :set_restaurant

  def index
    @menus = @restaurant.menus
  end

  def show
    @menu = @restaurant.menus.find(params[:id])
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
