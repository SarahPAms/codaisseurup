require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "validations" do

    it "is invalid without a name" do
      event = Event.new(name: "")
      event.valid?
      expect(event.errors).to have_key(:name)
    end

    it "is invalid without a description" do
      event = Event.new(description: "")
      event.valid?
      expect(event.errors).to have_key(:description)
    end

    it "is invalid without a location" do
      event = Event.new(location: "")
      event.valid?
      expect(event.errors).to have_key(:location)
    end
    it "is invalid without a price" do
      event = Event.new(price: "")
      event.valid?
      expect(event.errors).to have_key(:price)
    end
    it "is valid without a capacity" do
      event = Event.new(capacity: "")
      event.valid?
      expect(event.errors).to have_key(:capacity)
    end
    it "is invalid without a start time" do
      event = Event.new(starts_at: "")
      event.valid?
      expect(event.errors).to have_key(:starts_at)
    end
  end
end
