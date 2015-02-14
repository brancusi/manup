class User < ActiveRecord::Base
	acts_as_authorization_subject
	has_secure_password

	after_create :access_token

	has_one :api_key, dependent: :destroy

	validates :email, uniqueness: true

	def access_token
		generate_token if api_key.nil?

		api_key.access_token
	end

	def generate_token
		destroy_token
		ApiKey.create!(user:self)
		api_key.access_token
	end

	def destroy_token
		ApiKey.where(user:self).destroy_all
	end

end