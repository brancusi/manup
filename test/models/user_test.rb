require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "has access token when created" do
  	user = User.create(email:'fred@bedrock.com', password:'qwerty123')
  	assert user.access_token, 'Testing!!!!'
  end
end
