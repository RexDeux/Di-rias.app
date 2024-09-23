class Dish < ActiveRecord::Base
  belongs_to :menu
  validates_presence_of :name, :menu_id, :price
  # Optional: This ensures that a menu is created when a restaurant is created
end