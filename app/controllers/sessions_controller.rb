class SessionsController < ApplicationController
    
  def new
  end

  def create
    #test = "hello debugger"
    #binding.pry
    # @user = User.find(2)
    # @user = User.find_by(email: params[:email])
    # @user = User.find_by_email(params[:email])
    # @user = User.where(email: params[:email]).first
    # @user = User.where("email = ?", params[:email]).first
    # @user = User.where("email = ? AND username = ?", params[:email], params[:username]).first
    # @user = User.where("email = ?", params[:email]).where("username = ?", params[:username]).first

    # @user = User.with_email(params[:email]).with_username(params[:username]).first
    # @user = User.with_email_and_username(params[:email], params[:username])  
      
      
    @user = User.find_by_email(params[:email])

    if @user && @user.authenticate(params[:password])
      session[:user] = @user.id
      flash[:notice] = 'User authenticated :)'
      redirect_to root_path
    else
      flash[:error] = "Invalid email or password :'("
      render :new
    end
  end

  def destroy
    session[:user] = nil
    redirect_to root_path
  end
end