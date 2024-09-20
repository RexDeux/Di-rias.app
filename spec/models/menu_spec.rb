require 'rails_helper'

RSpec.describe Menu, type: :model do
  it 'is invalid without a name' do
    menu = Menu.new
    expect(menu).not_to be_valid
  end

  it 'is invalid without a restaurant' do
    menu = Menu.new(name: 'Dinner Menu')
    expect(menu).not_to be_valid
  end

  it 'belongs to a restaurant' do
    restaurant = Restaurant.create(name: 'Chez Gourmet', address: '123 Food St.', city: 'San Francisco')
    menu = restaurant.create_menu(name: 'Dinner Menu')
    expect(menu.restaurant).to eq(restaurant)
  end
end
