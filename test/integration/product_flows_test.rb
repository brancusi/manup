require 'test_helper'
require 'json'

class V1::TestControllerTest < ActionDispatch::IntegrationTest

  test "should get v1 - contact index" do
  	binding.pry
  	sign_in :user, @user
    get '/contacts', {}, {'Accept' => 'version=1'}
    assert_response 200
    assert_equal "Lassen's", JSON.parse(@response.body)['contacts'][0]['name']
  end
end