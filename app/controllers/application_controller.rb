class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?

  def current_user
    @current_user  ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user # Return true if current_user exists, otherwise return false. The !! is a way to convert any value to a boolean
  end

  def require_login
    if !logged_in?
      flash[:alert] = "You need to be logged in to perform that action"
      redirect_to login_path
    end
  end
end
