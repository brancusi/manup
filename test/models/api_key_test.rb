require 'test_helper'

class ApiKeyTest < ActiveSupport::TestCase
  test "has access token" do
    api_key = ApiKey.create(user:User.first)
    assert api_key.access_token
  end

  test "generate new unique token" do
    api_key = ApiKey.create(user:User.first)
    old_token = api_key.access_token
    new_token = api_key.refresh_access_token
    assert_not_equal old_token, new_token, "Tokens don't match"
  end

  test "deleting user destroys api_key" do

    api_key = ApiKey.create(user:User.first)
    before_count = ApiKey.all.count
    User.first.destroy
    after_count = ApiKey.all.count

    assert after_count < before_count, 'ApiKey was not destroyed when user was'
  end
end