class Event < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :price, presence: true
  validates :capacity, presence: true
  validates :starts_at, presence: true

end
