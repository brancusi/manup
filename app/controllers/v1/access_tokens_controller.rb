class V1::AccessTokensController < ApplicationController

  def create
    user = User.find_by(email:params[:email])
    if user && user.authenticate(params[:password])
      render json: user
    else
      render json: user.errors, status: :unauthorized
    end
  end
  
end
