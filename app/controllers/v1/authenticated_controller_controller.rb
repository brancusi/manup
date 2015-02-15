class V1::AuthenticatedControllerController < ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods
	
  before_filter :check_login

  rescue_from Acl9::AccessDenied, with: :user_not_authorized

  attr_accessor :current_user

  def check_login
    authenticate! if self.current_user.nil?
  end

  def authenticate!
    authenticate_or_request_with_http_token do |token, options|
      self.current_user = ApiKey.find_by(access_token: token).user if ApiKey.exists?(access_token: token)
    end
  end

  def user_not_authorized
    render json: {:message => "Permission denied"}, status: :unauthorized
  end

end