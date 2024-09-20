class RestaurantsController < ApplicationController
  def index
    Restaurants.all
  end
end
