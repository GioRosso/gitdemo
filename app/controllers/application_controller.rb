class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def logged_in_user
      @current_user ||= User.find(session[:user]) if session[:user]
#   if session[:user]
#       @current_user = User.find(session[:user])
#   end
  
  end
  
  helper_method :logged_in_user
  
  protected
  
  def authorize
        redirect_to login_path unless logged_in_user
  end
  
end
