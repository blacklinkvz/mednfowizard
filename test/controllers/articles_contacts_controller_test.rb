require "test_helper"

class ArticlesContactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @articles_contact = articles_contacts(:one)
  end

  test "should get index" do
    get articles_contacts_url
    assert_response :success
  end

  test "should get new" do
    get new_articles_contact_url
    assert_response :success
  end

  test "should create articles_contact" do
    assert_difference("ArticlesContact.count") do
      post articles_contacts_url, params: { articles_contact: { article_id: @articles_contact.article_id, contact_id: @articles_contact.contact_id } }
    end

    assert_redirected_to articles_contact_url(ArticlesContact.last)
  end

  test "should show articles_contact" do
    get articles_contact_url(@articles_contact)
    assert_response :success
  end

  test "should get edit" do
    get edit_articles_contact_url(@articles_contact)
    assert_response :success
  end

  test "should update articles_contact" do
    patch articles_contact_url(@articles_contact), params: { articles_contact: { article_id: @articles_contact.article_id, contact_id: @articles_contact.contact_id } }
    assert_redirected_to articles_contact_url(@articles_contact)
  end

  test "should destroy articles_contact" do
    assert_difference("ArticlesContact.count", -1) do
      delete articles_contact_url(@articles_contact)
    end

    assert_redirected_to articles_contacts_url
  end
end
