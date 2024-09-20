class Menu < ActiveRecord::Base
  belongs_to :restaurant
  validates :restaurant_id, presence: true
  has_many :dishes, as: :menuable
  validates_presence_of :name, :restaurant_id
  # Optional: This ensures that a menu is created when a restaurant is created
end