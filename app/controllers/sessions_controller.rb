class SessionsController < ApplicationController
  
  def new
    
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase) # Find user by email
    if user && user.authenticate(params[:session][:password]) 
      session[:user_id] = user.id # Store user id in session
      flash[:notice] = "Logged in successfully"
      redirect_to  user # or this user_path(user) to be explicit
    else
      flash.now[:alert] = "Check username or password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil # Clear session
    flash[:notice] = "Logged out"
    redirect_to root_path
  end
end