class ContactPolicy

  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @contact = model
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
  	true
  end

  def update?
    true
  end

  def destroy?
    true
  end

end