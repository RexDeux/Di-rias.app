class Dish < ActiveRecord::Base
  belongs_to :menuable, polymorphic: true
  validates_presence_of :name, :menu_ids_id, :price
  # Optional: This ensures that a menu is created when a restaurant is created
end