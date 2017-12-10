class Atm < ApplicationRecord
  validates :name, presence: true
  validates :lat, presence: true
  validates :lon, presence: true
end
