class UsersController < ApplicationController
    
  before_action :authorize, except: [:new, :create]
    
  def new
    @user = User.new
  end

  def create

    @user = User.new(user_params)
    binding.pry

    if @user.save
        binding.pry
      flash[:notice] = 'User created successfully :)'
      redirect_to root_path
    else
      render :new
    end
  end

  private

    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
end