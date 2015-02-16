class User < ActiveRecord::Base

  acts_as_authorization_subject
  
  has_secure_password

  after_create :set_default

  has_one :api_key, dependent: :destroy

  validates :email, uniqueness: true
  validates :first_name, presence: true, on: :create
  validates :password_confirmation, presence: true, on: :create

  def access_token
    generate_api_key if self.api_key.nil?
    self.api_key.access_token
  end

  def refresh_access_token
    generate_api_key if self.api_key.nil?
    self.api_key.refresh_access_token
    self.api_key.access_token
  end

  private
  def set_default
    generate_api_key
    generate_access_rights
  end

  def generate_api_key
    self.api_key = ApiKey.create(user_id:id)
  end

  def generate_access_rights
    self.has_role!(:owner, self)
  end

end