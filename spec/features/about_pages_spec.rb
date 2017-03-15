require "rails_helper"

describe "About Page" do
  it "shows information about the application" do
    visit root_url
    click_on "About"

    expect(page).to have_content "These events are offered to you since 2017"
  end
end
