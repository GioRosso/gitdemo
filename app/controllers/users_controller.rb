class UsersController < ApplicationController
    
  # before_action :authorize, except: [:new, :create]
    
  def new
    @user = User.new
  end

  def create

    @user = User.new(user_params)

    if @user.save
      flash[:notice] = 'User created successfully'
      redirect_to root_path
    else
      render :new
    end
  end
  
  def show
  
  end
  
=begin
  def index
  @users = User.all
  end
  
  def show
        user_id = params[:id]
        @user = User.find(user_id)
  end
=end
  
  private
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation, :role)
    end
end