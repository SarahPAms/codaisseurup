require 'rails_helper'

RSpec.describe User, type: :model

  describe "association with room" do
    let(:user) {create :user}
    let!(:event) {create :event, user: user}

    it "has many events" do
      event1 = user.events.new(name: "Rock n Roll")
      event2 = user.events.new(name: "Blimey")

      expect(user.events).to include(event1)
      expect(user.events).to include(event2)
    end

    it "cascades dependent deletions" do
      expect { user.destroy }.to change(Event, :count).by(-1)
    end
  end
