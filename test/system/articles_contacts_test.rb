require "application_system_test_case"

class ArticlesContactsTest < ApplicationSystemTestCase
  setup do
    @articles_contact = articles_contacts(:one)
  end

  test "visiting the index" do
    visit articles_contacts_url
    assert_selector "h1", text: "Articles contacts"
  end

  test "should create articles contact" do
    visit articles_contacts_url
    click_on "New articles contact"

    fill_in "Article", with: @articles_contact.article_id
    fill_in "Contact", with: @articles_contact.contact_id
    click_on "Create Articles contact"

    assert_text "Articles contact was successfully created"
    click_on "Back"
  end

  test "should update Articles contact" do
    visit articles_contact_url(@articles_contact)
    click_on "Edit this articles contact", match: :first

    fill_in "Article", with: @articles_contact.article_id
    fill_in "Contact", with: @articles_contact.contact_id
    click_on "Update Articles contact"

    assert_text "Articles contact was successfully updated"
    click_on "Back"
  end

  test "should destroy Articles contact" do
    visit articles_contact_url(@articles_contact)
    click_on "Destroy this articles contact", match: :first

    assert_text "Articles contact was successfully destroyed"
  end
end
