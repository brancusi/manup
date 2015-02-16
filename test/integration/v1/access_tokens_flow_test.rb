require 'test_helper'

class V1::AccessTokensFlowTest < ActionDispatch::IntegrationTest
  test "can create a new access token" do
    user = User.first
    
    post '/access_tokens', {:email => user.email, :password => default_password}, {'Accept' => 'version=1'}
    assert_response 200

    data = JSON.parse(@response.body)
    assert_equal user.email, data['email']
    assert data['access_token'].present?
  end
end
