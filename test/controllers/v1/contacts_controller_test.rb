require 'test_helper'

class V1::ContactsControllerTest < ActionController::TestCase

  class AdminRights < ActionController::TestCase

    def setup
      login :admin
    end

    def teardown
      @controller.current_user = nil
    end

    test "admins should get contact list" do
      get :index
      assert_response :success
      data = JSON.parse @response.body
      
      assert_equal data['contacts'][0]['name'], "Lassen's"
    end

    test "admins should create contacts" do
      post(:create, {:name => 'Barney', :code => '001'})
      assert_response :success
      data = JSON.parse @response.body
      
      assert_equal data['name'], "Barney"
    end

    test "admins should update contacts" do

      put(:update, {'id'=>Contact.first.id, 'name'=>'Evil Co.'})

      assert_response :success

      data = JSON.parse @response.body
      
      assert_equal data['name'], "Evil Co."
    end

    test "admins should delete contacts" do
      delete(:destroy, {:id=>Contact.first})
      assert_response :success
    end

  end

  class ViewerRights < ActionController::TestCase

    def setup
      login :viewer
    end

    def teardown
      @controller.current_user = nil
    end

    test "viewers should get contact list" do
      get :index
      assert_response :success
      data = JSON.parse @response.body
      
      assert_equal data['contacts'][0]['name'], "Lassen's"
    end

    test "viewers should not create contact" do
      post(:create, {:contact=>{:name => 'Barney', :code => '001'}})
      assert_response :unauthorized
    end

    test "viewers should not update contacts" do
      put(:update, {'id'=>Contact.first.id, 'name'=>'Evil Co.'})
      assert_response :unauthorized
    end

    test "viewers should not delete contact" do
      delete(:destroy, {:id=>Contact.first})
      assert_response :unauthorized
    end

  end

end