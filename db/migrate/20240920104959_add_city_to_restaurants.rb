class AddCityToRestaurants < ActiveRecord::Migration[7.0]
  def change
    add_column :restaurants, :city, :string
  end
end
