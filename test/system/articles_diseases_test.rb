require "application_system_test_case"

class ArticlesDiseasesTest < ApplicationSystemTestCase
  setup do
    @articles_disease = articles_diseases(:one)
  end

  test "visiting the index" do
    visit articles_diseases_url
    assert_selector "h1", text: "Articles diseases"
  end

  test "should create articles disease" do
    visit articles_diseases_url
    click_on "New articles disease"

    fill_in "Article", with: @articles_disease.article_id
    fill_in "Disease", with: @articles_disease.disease_id
    click_on "Create Articles disease"

    assert_text "Articles disease was successfully created"
    click_on "Back"
  end

  test "should update Articles disease" do
    visit articles_disease_url(@articles_disease)
    click_on "Edit this articles disease", match: :first

    fill_in "Article", with: @articles_disease.article_id
    fill_in "Disease", with: @articles_disease.disease_id
    click_on "Update Articles disease"

    assert_text "Articles disease was successfully updated"
    click_on "Back"
  end

  test "should destroy Articles disease" do
    visit articles_disease_url(@articles_disease)
    click_on "Destroy this articles disease", match: :first

    assert_text "Articles disease was successfully destroyed"
  end
end
