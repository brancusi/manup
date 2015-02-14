require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "has access token when created" do
    user = User.create(first_name:'Barney', email:'new_user@bedrock.com', password:'password')
    assert user.api_key.access_token, 'User does not have access token'
  end

  test "cannot create user without first name" do
    user = User.new(first_name:nil, email:'new_user@bedrock.com', password:'password')
    assert_not user.save, 'Created user without a first name'
  end

  test "cannot create duplicate user email" do
    user = User.create(first_name:'barney', email:'barney@bedrock.com', password:'password')
    duplicate_user = User.new(first_name:'barney', email:'barney@bedrock.com', password:'password')
    assert_not duplicate_user.save, 'Created user with duplicate email'
  end

end