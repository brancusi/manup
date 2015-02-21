class V1::UsersController < V1::AuthenticatedControllerController
  before_action :set_user, only: [:show, :update, :destroy]

  access_control :debug => true do
    
    allow :admin    
    allow :viewer, :to => [:index]
    allow all, anonymous, :to => [:create]
    allow :owner, :of => :user, :to => [:show, :update, :destroy]

  end

  def index
    render json: User.all
  end

  def show
    render json: @user
  end

  def create
    user = User.new(safe_params)
    user.has_role! :owner, user

    if user.save
        $pubnub.publish(
          :channel => 'pubnub_chat',
          :callback => lambda {|x|},
          :message => {
              :message => "Oh shit son!"
          })

        render json: user
    else
        render json: user.errors, status: :bad_request
    end
  end

  def update
    if @user.update(safe_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @user.destroy
      render json: {:message=>"User deleted."}, status: :ok
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def safe_params
    params.permit(:first_name, :last_name, :phone, :email, :password, :password_confirmation)
  end
end