require 'test_helper'

class V1::AuthenticatedControllerTest < ActionController::TestCase
  def login(role)
    user = User.first
    user.has_role! role
    @controller.current_user = user
  end

  def teardown
    @controller.current_user = nil
  end
end
