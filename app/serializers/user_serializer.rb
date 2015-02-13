class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :token

  def token
  	object.api_key.access_token if object.api_key
  end

end
