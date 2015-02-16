class V1::AuthenticatedControllerController < ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods
	
  attr_accessor :current_user

  before_filter :check_login

  rescue_from Acl9::AccessDenied, with: :user_not_authorized

  def check_login
    authenticate if current_user.nil?
  end

  private
  def authenticate
    authenticate_with_http_token do |token, options|
      self.current_user = ApiKey.find_by(access_token: token).user if ApiKey.exists?(access_token: token)
    end
  end

  def user_not_authorized
    render json: {:message => "Permission denied fool!"}, status: :unauthorized
  end

end