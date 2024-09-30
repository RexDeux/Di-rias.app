class Restaurant < ActiveRecord::Base
  has_one :menu, dependent: :destroy
  validates_presence_of :name, :address, :city, presence: true
  has_many :users
  # Optional: This ensures that a menu is created when a restaurant is created
end