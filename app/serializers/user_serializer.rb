class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :access_token

  def token
  	object.api_key.access_token if object.api_key
  end

end
