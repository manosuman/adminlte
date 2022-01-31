class UsersController < JwtController
    before_action :authorized, only: [:auto_login]
    
    def index
      if (logged_in?)
        redirect_to home_path
      end
    end

    def new
      @user=User.new
    end

  # REGISTER
  def create
    @user = User.create(user_params)
    if @user.valid?
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token}
    else
      render json: {error: "Invalid username or password"}
    end
  end

  # LOGGING IN
  def login
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token}
    else
      render json: {error: "Invalid username or password"}
    end
  end

  def auto_login
    render json: @user
  end

  def logout
    redirect_to root_path
  end


  private
  def user_params
    params.permit(:username, :password, :age)
  end
end
