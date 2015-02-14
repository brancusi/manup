class V1::SessionsController < ApplicationController
  def create
  	user = User.find_by(email:params[:email])
  	if user && user.authenticate(params[:password])
  		render json: user
  	else
  		render json: user.errors, status: :unauthorized
  	end
  end

  def destroy
  	api_key = ApiKey.find_by(access_token:params[:id])

  	if api_key.user
  		api_key.user.destroy_token
  		render json: '{"message":"Session destroyed"}', status: :ok
  	else
  		render json: '{"errors":[{"message":"Token not found"}]}', status: :bad_request
  	end
  end
end
