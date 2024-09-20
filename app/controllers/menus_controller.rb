class MenusController < ApplicationController
  def index
    Menus.all
  end
end
