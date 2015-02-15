require 'test_helper'

class V1::AccessTokensControllerTest < ActionController::TestCase
  test "should get create" do
    user = User.first
    post(:create, {email:user.email, password:'password'})

    assert_response :success

    data = JSON.parse @response.body
    
    assert_equal data['email'], user.email
    assert_equal data['access_token'], user.access_token
  end

end
