require 'test_helper'

class ApiKeyTest < ActiveSupport::TestCase
  test "has access token" do
    api_key = ApiKey.create(user:User.first)
    assert api_key.access_token
  end

  test "generate new unique token" do
    api_key = User.first.api_key
    old_token = api_key.access_token
    new_token = api_key.refresh_access_token!
    assert_not_equal old_token, new_token
  end

  test "deleting user destroys api_key" do
    destroyed_user = User.first.destroy
    assert destroyed_user.api_key.destroyed?, 'ApiKey was not destroyed when user was'
  end
end