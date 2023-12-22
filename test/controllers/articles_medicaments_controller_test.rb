require "test_helper"

class ArticlesMedicamentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @articles_medicament = articles_medicaments(:one)
  end

  test "should get index" do
    get articles_medicaments_url
    assert_response :success
  end

  test "should get new" do
    get new_articles_medicament_url
    assert_response :success
  end

  test "should create articles_medicament" do
    assert_difference("ArticlesMedicament.count") do
      post articles_medicaments_url, params: { articles_medicament: { article_id: @articles_medicament.article_id, medicament_id: @articles_medicament.medicament_id } }
    end

    assert_redirected_to articles_medicament_url(ArticlesMedicament.last)
  end

  test "should show articles_medicament" do
    get articles_medicament_url(@articles_medicament)
    assert_response :success
  end

  test "should get edit" do
    get edit_articles_medicament_url(@articles_medicament)
    assert_response :success
  end

  test "should update articles_medicament" do
    patch articles_medicament_url(@articles_medicament), params: { articles_medicament: { article_id: @articles_medicament.article_id, medicament_id: @articles_medicament.medicament_id } }
    assert_redirected_to articles_medicament_url(@articles_medicament)
  end

  test "should destroy articles_medicament" do
    assert_difference("ArticlesMedicament.count", -1) do
      delete articles_medicament_url(@articles_medicament)
    end

    assert_redirected_to articles_medicaments_url
  end
end
