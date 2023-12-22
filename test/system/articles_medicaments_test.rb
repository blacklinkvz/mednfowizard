require "application_system_test_case"

class ArticlesMedicamentsTest < ApplicationSystemTestCase
  setup do
    @articles_medicament = articles_medicaments(:one)
  end

  test "visiting the index" do
    visit articles_medicaments_url
    assert_selector "h1", text: "Articles medicaments"
  end

  test "should create articles medicament" do
    visit articles_medicaments_url
    click_on "New articles medicament"

    fill_in "Article", with: @articles_medicament.article_id
    fill_in "Medicament", with: @articles_medicament.medicament_id
    click_on "Create Articles medicament"

    assert_text "Articles medicament was successfully created"
    click_on "Back"
  end

  test "should update Articles medicament" do
    visit articles_medicament_url(@articles_medicament)
    click_on "Edit this articles medicament", match: :first

    fill_in "Article", with: @articles_medicament.article_id
    fill_in "Medicament", with: @articles_medicament.medicament_id
    click_on "Update Articles medicament"

    assert_text "Articles medicament was successfully updated"
    click_on "Back"
  end

  test "should destroy Articles medicament" do
    visit articles_medicament_url(@articles_medicament)
    click_on "Destroy this articles medicament", match: :first

    assert_text "Articles medicament was successfully destroyed"
  end
end
