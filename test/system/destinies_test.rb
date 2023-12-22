require "application_system_test_case"

class DestiniesTest < ApplicationSystemTestCase
  setup do
    @destiny = destinies(:one)
  end

  test "visiting the index" do
    visit destinies_url
    assert_selector "h1", text: "Destinies"
  end

  test "should create destiny" do
    visit destinies_url
    click_on "New destiny"

    fill_in "Country", with: @destiny.country_id
    fill_in "Fishis date", with: @destiny.fishis_date
    fill_in "Start date", with: @destiny.start_date
    fill_in "Travel", with: @destiny.travel_id
    click_on "Create Destiny"

    assert_text "Destiny was successfully created"
    click_on "Back"
  end

  test "should update Destiny" do
    visit destiny_url(@destiny)
    click_on "Edit this destiny", match: :first

    fill_in "Country", with: @destiny.country_id
    fill_in "Fishis date", with: @destiny.fishis_date
    fill_in "Start date", with: @destiny.start_date
    fill_in "Travel", with: @destiny.travel_id
    click_on "Update Destiny"

    assert_text "Destiny was successfully updated"
    click_on "Back"
  end

  test "should destroy Destiny" do
    visit destiny_url(@destiny)
    click_on "Destroy this destiny", match: :first

    assert_text "Destiny was successfully destroyed"
  end
end
