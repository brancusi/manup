require 'test_helper'
require 'json'

class ProductFlowsTest < ActionDispatch::IntegrationTest

  test "viewer role can list contacts" do
  	viewer = User.last
  	viewer.has_role! :viewer
    get '/contacts', {}, {'Accept' => 'version=1', 'Authorization' => "Token token=#{viewer.access_token}"}
    assert_response 200
    assert_equal "Lassen's", JSON.parse(@response.body)['contacts'][0]['name']
  end

  test "admin role can list contacts" do
  	admin = User.last
  	admin.has_role! :admin
    get '/contacts', {}, {'Accept' => 'version=1', 'Authorization' => "Token token=#{admin.access_token}"}
    assert_response 200
    assert_equal "Lassen's", JSON.parse(@response.body)['contacts'][0]['name']
  end

end