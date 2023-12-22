require "test_helper"

class ArticlesDiseasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @articles_disease = articles_diseases(:one)
  end

  test "should get index" do
    get articles_diseases_url
    assert_response :success
  end

  test "should get new" do
    get new_articles_disease_url
    assert_response :success
  end

  test "should create articles_disease" do
    assert_difference("ArticlesDisease.count") do
      post articles_diseases_url, params: { articles_disease: { article_id: @articles_disease.article_id, disease_id: @articles_disease.disease_id } }
    end

    assert_redirected_to articles_disease_url(ArticlesDisease.last)
  end

  test "should show articles_disease" do
    get articles_disease_url(@articles_disease)
    assert_response :success
  end

  test "should get edit" do
    get edit_articles_disease_url(@articles_disease)
    assert_response :success
  end

  test "should update articles_disease" do
    patch articles_disease_url(@articles_disease), params: { articles_disease: { article_id: @articles_disease.article_id, disease_id: @articles_disease.disease_id } }
    assert_redirected_to articles_disease_url(@articles_disease)
  end

  test "should destroy articles_disease" do
    assert_difference("ArticlesDisease.count", -1) do
      delete articles_disease_url(@articles_disease)
    end

    assert_redirected_to articles_diseases_url
  end
end
