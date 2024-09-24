class DishesController < ApplicationController
  before_action :set_menu

  def new
    @dish = @menu.dishes.new
  end

  def create
    @dish = @menu.dishes.new(dishes_params)
    if @dish.save
      redirect_to restaurant_menu_path(@menu.restaurant, @menu), notice: "Prato criado com sucesso"
    else
      render :new
    end
  end

  def edit 
    @dish = @mnu.dishes.find(params[:id])
  end

  def update
    @dish = @menu.dishes.find(params[:id])
    if @dish.update(dish_params)
      redirect_to restaurant_menu_path(@menu.restaurant, @dishes), notice: 'Menu was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:restaurant_id])
    @menu = Menu.find(params[:menu_id])
    @dish
  end

  private

  def set_menu
    @menu = Menu.find(params[:menu_id])
  end

  def dish_params
    params.require(:dish).permit(:name, :description, :price, :quantity, :image)
  end
end
