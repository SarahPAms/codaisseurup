class Event < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :categories
  has_many :photos, dependent: :destroy
  has_many :registrations, dependent: :destroy
  has_many :guests, through: :registrations, source: :user


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

  def self.alphabetize
    order(name: :asc)
  end

  def self.published
    where(active: true)
  end

  def self.starts_before_ends_after(starts, ends)
    where('starts_at < ? AND ends_at >?', starts, ends)
  end

  def self.starts_during(starts, ends)
    where('starts_at > ? AND starts_at < ?', starts, ends)
  end

  def self.ends_during(starts, ends)
    where('ends_at > ? AND ends_at < ?', starts, ends)
  end

  def self.during(starts, ends)
    starts = starts.change(hour: 19, min: 00, sec:00)
    ends = ends.change(hour: 20, min: 00, sec:00)

    starts_before_ends_after(starts, ends)
    .or(ends_during(starts, ends))
    .or(starts_during(starts, ends))
  end
end
