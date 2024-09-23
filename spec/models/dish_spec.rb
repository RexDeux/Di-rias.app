require 'rails_helper'

RSpec.describe Dish, type: :model do
  let(:restaurant) { Restaurant.create!(name: "Chez Gourmet", address: "123 Food St.", city: "San Francisco") }
  let(:menu) { restaurant.create_menu!(name: "Dinner Menu") }

  context "validations" do
    it "is valid with a name and an associated restaurant through a menu" do      
      # Create and save a Dish associated with the Menus
      dish = menu.dishes.create!(name: "Spaghetti", price: "10")

      expect(dish).to be_valid 
      expect(dish.menu).to eq(menu)
      expect(dish.menu.restaurant).to eq(restaurant)
    end

    it "is invalid without a name" do
      dish = menu.dishes.build(name: nil)

      expect(dish).not_to be_valid
      expect(dish.errors[:name]).to include("can't be blank")
    end

    it "is invalid without a menu" do
      # Attempt to create a Dish without any associated menu (Menu or other)
      dish = Dish.new(name: "Spaghetti")

      expect(dish).not_to be_valid
      expect(dish.errors[:menu]).to include("must exist")
    end
  end
end
