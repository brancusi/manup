class V1::ContactsController < V1::AuthenticatedControllerController

  access_control do
    allow :admin, :viewer
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
      render status: :ok
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  private
    def set_contact
      @contact = Contact.find(params[:id])
    end

    def safe_params
      params.require(:contact).permit(:name, :code, :credit_rate)
    end

end
