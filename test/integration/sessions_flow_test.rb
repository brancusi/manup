require 'test_helper'

class SessionsFlowTest < ActionDispatch::IntegrationTest
  test "can create a new session" do
    user = User.first
    
    post '/sessions', {:email => user.email, :password => 'password'}, {'Accept' => 'version=1'}
    assert_response 200

    data = JSON.parse(@response.body)
    assert_equal user.email, data['email']
    assert data['token'].present?
  end
end
