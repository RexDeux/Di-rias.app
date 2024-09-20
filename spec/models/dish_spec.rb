require 'rails_helper'

RSpec.describe Dish, type: :model do
  it 'is invalid without a name' do
    dish = Dish.new
    expect(dish).not_to be_valid
  end

  it 'is invalid without a menu' do
    dish = Dish.new(name: 'Dish name')
    expect(dish).not_to be_valid
  end

  it 'belongs to a menu' do
    menu = Menu.create(name: 'Chez Gourmet Menu')
    dish = menu.create_dish(name: 'Dish')
    expect(dish.menu).to eq(menu)
  end
end
