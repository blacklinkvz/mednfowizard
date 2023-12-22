require "application_system_test_case"

class MedicamentsTest < ApplicationSystemTestCase
  setup do
    @medicament = medicaments(:one)
  end

  test "visiting the index" do
    visit medicaments_url
    assert_selector "h1", text: "Medicaments"
  end

  test "should create medicament" do
    visit medicaments_url
    click_on "New medicament"

    fill_in "Compound", with: @medicament.compound
    fill_in "Name", with: @medicament.name
    fill_in "Unit", with: @medicament.unit_id
    click_on "Create Medicament"

    assert_text "Medicament was successfully created"
    click_on "Back"
  end

  test "should update Medicament" do
    visit medicament_url(@medicament)
    click_on "Edit this medicament", match: :first

    fill_in "Compound", with: @medicament.compound
    fill_in "Name", with: @medicament.name
    fill_in "Unit", with: @medicament.unit_id
    click_on "Update Medicament"

    assert_text "Medicament was successfully updated"
    click_on "Back"
  end

  test "should destroy Medicament" do
    visit medicament_url(@medicament)
    click_on "Destroy this medicament", match: :first

    assert_text "Medicament was successfully destroyed"
  end
end
