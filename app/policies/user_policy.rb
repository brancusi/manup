class UserPolicy

  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @contact = model
  end

  def make_admin?
  	
  end

end