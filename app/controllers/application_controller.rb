class ApplicationController < ActionController::API
	include Pundit
	
	# before_filter :authenticate_user!

	# after_action :verify_authorized

end