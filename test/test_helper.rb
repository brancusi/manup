require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  
  # Add more helper methods to be used by all tests here...

end

class ActionController::TestCase
  def login(role)
    user = User.first
    user.has_role! role
    @controller.current_user = user

  end
end

# class ActionDispatch::IntegrationTest
# 	def testthis
# 		binding.pry
# 	end
# end