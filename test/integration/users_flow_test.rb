require 'test_helper'

class UsersFlowTest < ActionDispatch::IntegrationTest
  test "can create new user" do
    post '/users', {:first_name => "Barney", :email => "barney@bedrock.com", :password => "password"}, {'Accept' => 'version=1'}
    assert_response 200

    data = JSON.parse(@response.body)
    assert_equal "barney@bedrock.com", data['email']
    assert data['token'].present?
  end

  
end