class Event < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :categories
  has_many :photos, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :price, presence: true
  validates :capacity, presence: true
  validates :starts_at, presence: true

  def bargain?
    price <30
  end

  def free?
    price == 0
  end

  def self.order_by_price
    order(:price)
  end
end
