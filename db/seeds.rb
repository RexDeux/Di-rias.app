# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

# Clear existing records
Restaurant.destroy_all
Menu.destroy_all
Dish.destroy_all
start_time = Time.now

# Reset sequence (for SQLite)
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='restaurants';")
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='menus';")
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='dishes';")

# Create random restaurants
5.times do
  restaurant = Restaurant.create!(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    city: Faker::Address.city
  )

  # Create random menus for each restaurant
  10.times do
    menu = restaurant.create_menu!(
      name: "#{Faker::Restaurant.type} Menu"
    )

    # Create random dishes for each menu
    15.times do
      menu.dishes.create!(
        name: Faker::Food.dish,
        price: Faker::Commerce.price
      )
    end
  end
end

puts "Seeding took #{Time.now - start_time} seconds"
