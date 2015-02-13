class User < ActiveRecord::Base
	acts_as_authorization_subject
	has_secure_password

	after_create :generate_token

	has_one :api_key, dependent: :destroy

	validates :email, uniqueness: true

	def retrieve_or_generate_token
		refresh_token if api_key.nil?		
	end

	def refresh_token
		destroy_token
		generate_token		
	end

	def generate_token
		ApiKey.create!(user_id:id)
	end

	def destroy_token
		ApiKey.where(user:self).destroy_all
	end

end