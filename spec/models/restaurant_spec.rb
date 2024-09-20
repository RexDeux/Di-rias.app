require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  it 'is invalid without a name' do
    restaurant = Restaurant.new(address: '123 Food St.', city: 'San Francisco')
    expect(restaurant).not_to be_valid
  end

  it 'is invalid without an address' do
    restaurant = Restaurant.new(name: 'Chez Gourmet', city: 'San Francisco')
    expect(restaurant).not_to be_valid
  end

  it 'has one menu' do
    restaurant = Restaurant.create(name: 'Chez Gourmet', address: '123 Food St.', city: 'San Francisco')
    menu = restaurant.create_menu(name: 'Dinner Menu')
    expect(restaurant.menu).to eq(menu)
  end
end
