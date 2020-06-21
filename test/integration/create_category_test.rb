require 'test_helper'

class CreateCategoryTest < ActionDispatch::IntegrationTest
  setup do
    @admin_user = User.create(username: "William", email: "william@yahoo.ca",
                              password: "password", admin: true)
    sign_in_as(@admin_user)
  end
  test "Get New Category Form and Create the Category" do
    get "/categories/new"
    assert_response :success
    assert_difference 'Category.count', 1 do
      post categories_path, params: { category: { name: "Sports" } }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "Sports",  response.body
  end
  test "Get New Category Form and Reject the Category Submission" do
    get "/categories/new"
    assert_response :success
    assert_no_difference 'Category.count' do
      post categories_path, params: { category: { name: " " } }
    end
    assert_match "errors", response.body 
    assert_select 'h3.error-title'
  end
    
end

