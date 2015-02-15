class V1::ContactsController < V1::AuthenticatedControllerController

  access_control do

    action :index do
      allow :viewer
      allow :admin
    end

    action :create do
      allow :admin
    end

    action :update do
      allow :admin
    end

    action :destroy do
      allow :admin
    end

  end

  before_action :set_contact, only: [:show, :update, :destroy]

  def index
    render json: Contact.all
  end

  def show
    render json: @contact
  end

  def create
    contact = Contact.new(safe_params)

    if contact.save
      render json: contact
    else
      render json: contact.errors, status: :unprocessable_entity
    end
    
  end

  def update
    if @contact.update(safe_params)
      render json: @contact
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @contact.destroy
      render json: {:message=>"Contact deleted."}, status: :ok
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  private
    def set_contact
      @contact = Contact.find(params[:id])
    end

    def safe_params
      params.permit(:name, :code)
    end

end
