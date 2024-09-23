class Menu < ActiveRecord::Base
  belongs_to :restaurant
  validates :name, :restaurant, presence: true
  has_many :dishes, dependent: :destroy
  # Optional: This ensures that a menu is created when a restaurant is created
end