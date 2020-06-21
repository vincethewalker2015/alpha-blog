require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest

  def setup 
    @article = Article.new(title: "Toys for Boys", description: "Good Book about mens Toys")
  end

  test "Article should be valid" do
    assert_not @article.valid?
  end

  test "should get edit" do
    get @article_edit_url
    assert_response :success
  end

  test "should get index" do
    get @articles_index_url
    assert_response :success
  end

  test "should get new" do
    get @article_new_url
    assert_response :success
  end

  test "should get show" do
    get @article_show_url
    assert_response :success
  end

end
