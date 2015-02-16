require 'codeclimate-test-reporter'

CodeClimate::TestReporter.start

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

# Setup password helper
require 'test_password_helper'
ActiveRecord::FixtureSet.context_class.send :include, TestPasswordHelper

class ActiveSupport::TestCase
  include TestPasswordHelper

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  
  # Add more helper methods to be used by all tests here...

end

class ActionController::TestCase

  def login(role)
    @test_user = User.first
    @test_user.has_role! role
    @controller.current_user = @test_user
  end

  def logout
    @controller.current_user = nil
  end

end

# class ActionDispatch::IntegrationTest
# 	def testthis
# 		binding.pry
# 	end
# end

