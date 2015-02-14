class V1::AuthenticatedControllerController < ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods
	
  before_filter :authenticate!

  rescue_from Acl9::AccessDenied, with: :user_not_authorized

  def authenticate!
    authenticate_or_request_with_http_token do |token, options|
      @current_authenticated_user = ApiKey.find_by(access_token: token).user if ApiKey.exists?(access_token: token)
    end
  end

  def current_user
    @current_authenticated_user
  end

  def user_not_authorized
    render json: {:message => "Permission denied"}, status: :unauthorized
  end

end