class AddRestaurantToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :restaurant, foreign_key: true, null: true
  end
end
