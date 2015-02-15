require 'test_helper'

class V1::UsersControllerTest < ActionController::TestCase

  class AdminRights < ActionController::TestCase

    def setup
      login :admin
    end

    def teardown
      logout
    end

    test "admins should get user list" do
      get :index
      assert_response :success
      data = JSON.parse @response.body
      
      assert_equal data['users'][0]['first_name'], "Fred"
    end

    test "admins should get single user" do
      get(:show, {id:User.first})
      assert_response :success
      data = JSON.parse @response.body
      
      assert_equal data['first_name'], "Fred"
    end

    test "admins should create users" do
      post(:create, {first_name:'Barney', email:'br@bedrock.com', password:'password'})
      assert_response :success
      data = JSON.parse @response.body
      
      assert_equal data['first_name'], "Barney"
    end

    test "admins should update users" do
      put(:update, {id:User.first, last_name:'Rubble'})
      assert_response :success
      data = JSON.parse @response.body
      
      assert_equal data['last_name'], "Rubble"
    end

    test "admins should delete users" do
      delete(:destroy, {:id=>User.first})

      assert_response :success
      data = JSON.parse @response.body

      assert_equal data['message'], "User deleted."
    end

  end

  class OwnerRights < ActionController::TestCase

    def setup
      login :owner
    end

    test "owners should not get user list" do
      get :index
      assert_response :unauthorized
    end

    test "owners should get their user account" do
      get(:show, {id:User.first})
      assert_response :success
      data = JSON.parse @response.body
      
      assert_equal data['first_name'], "Fred"
    end

    test "owners should create users" do
      post(:create, {first_name:'Barney', email:'br@bedrock.com', password:'password'})
      assert_response :success
      data = JSON.parse @response.body
      
      assert_equal data['first_name'], "Barney"
    end

    test "owners should update their user account" do
      put(:update, {id:User.first, last_name:'Rubble'})
      assert_response :success
      data = JSON.parse @response.body
      
      assert_equal data['last_name'], "Rubble"
    end

    test "owners should delete their user account" do
      delete(:destroy, {:id=>User.first})

      assert_response :success
      data = JSON.parse @response.body

      assert_equal data['message'], "User deleted."
    end

  end

end
