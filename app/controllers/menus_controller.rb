class MenusController < ApplicationController
  before_action :set_restaurant

  def index
    @menu = @restaurant.menu
  end

  def show
    @menu = @restaurant.menu
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
