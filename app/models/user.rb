class User < ActiveRecord::Base

  acts_as_authorization_subject
  
  has_secure_password

  after_create :generate_token

  has_one :api_key, dependent: :destroy

  validates :email, uniqueness: true
  validates :first_name, presence: true

  def access_token
    generate_token if api_key.nil?
    api_key.access_token
  end

  private
  def generate_token
    api_key = ApiKey.create(user_id:id)
  end

end