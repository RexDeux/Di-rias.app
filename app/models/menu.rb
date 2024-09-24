class Menu < ActiveRecord::Base
  belongs_to :restaurant
  validates :name, :restaurant, presence: true
  has_many :dishes, dependent: :destroy
  accepts_nested_attributes_for :dishes, allow_destroy: true
  # Optional: This ensures that a menu is created when a restaurant is created
end