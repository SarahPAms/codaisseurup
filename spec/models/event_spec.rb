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

    describe "association with user" do
      let(:user) {create :user}

      it "belongs to a user" do
        event = user.events.new(name: "Hunky Dory")

        expect(event.user).to eq(user)
      end

      describe
      describe "association with theme" do
        let(:event) { create :event }

        let(:category1) { create :category, name: "Sport", events:[event] }
        let(:category2) { create :category, name: "Entertainment", events:[event] }
        let(:category3) { create :category, name: "Music", events:[event] }

        it "has themes" do
          expect(event.categories).to include(category1)
          expect(event.categories).to include(category2)
          expect(event.categories).to include(category3)
        end

        describe ".order_by_price" do
          let!(:event1) { create :event, price: 10}
          let!(:event2) { create :event, price: 30}
          let!(:event3) { create :event, price: 50}

          it "returns sorted array of rooms by prices" do
            expect(Event.order_by_price).to match_array [event1, event2, event3]
          end
        end
      end
    end
  end
end
