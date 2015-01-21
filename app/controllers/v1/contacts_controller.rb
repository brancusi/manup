class V1::ContactsController < ApplicationController
	before_action :set_contact, only: [:show, :update, :destroy]

  def index
    # authorize Contact

  	render json: Contact.all
  end

  def show
    authorize @contact

    render json: @contact
  end

  def create
    authorize Contact

    contact = Contact.new(safe_params)

    if contact.save
      render json: contact
    else
      render json: contact.errors, status: :unprocessable_entity
    end
    
  end

  def update
    authorize @contact

    if @contact.update(safe_params)
      render json: @contact
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @contact

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
