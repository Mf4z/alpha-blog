class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?

  def current_user
    @current_user  ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user # Return true if current_user exists, otherwise return false. The !! is a way to convert any value to a boolean
  end
end
