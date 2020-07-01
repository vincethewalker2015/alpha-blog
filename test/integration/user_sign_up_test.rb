require 'test_helper'

class UserSignUpTest < ActionDispatch::IntegrationTest

  test "Should get login page" do
    get new_user_url
    assert true
  end

  test "Get New User form and Create New User" do
    get "/users/new"
    assert_response :success
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { username: "Vinnie", email: "vinnie@yahoo.ca", password: "password"} }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "Vinnie",  response.body
    assert_match "vinnie@yahoo.ca", response.body
  end

end
