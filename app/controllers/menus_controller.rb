class MenusController < ApplicationController
  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @menu = Menu.find(@restaurant.menu.id)
  end

  def edit
    @restaurant = Restaurant.find(params[:restaurant_id])
    @menu = Menu.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:restaurant_id])
    @menu = Menu.find(params[:id])
    
    if @menu.update(menu_params)
      redirect_to restaurant_menus_path(@restaurant), notice: 'Menu updated successfully.'
    else
      render :edit
    end
  end

  private

  def menu_params
    params.require(:menu).permit(:name, dishes_attributes: [:id, :name, :price, :quantity, :_destroy])
  end
end
