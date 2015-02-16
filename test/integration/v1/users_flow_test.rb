require 'test_helper'

class UsersFlowTest < ActionDispatch::IntegrationTest
  test "can create new user" do
    post '/users', {first_name:"Barney", email:"barney@bedrock.com", password:default_password, password_confirmation:default_password}, {'Accept' => 'version=1'}
    assert_response 200, "Response code is not correct"

    data = JSON.parse(@response.body)
    assert_equal "barney@bedrock.com", data['email'], "Email doesn't matches"
    assert data['access_token'].present?, "Token isn't present"
  end
  
end