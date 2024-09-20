class Restaurant < ActiveRecord::Base
  has_one :menu, dependent: :destroy
  validates_presence_of :name, :address, :city
  # Optional: This ensures that a menu is created when a restaurant is created
  accepts_nested_attributes_for :menu
end