class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # byebug  - stop the code here and check the params
    # params - to check the params
    # prams[:user][:username] - to check the username for example
    
    # Create user
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Signup Successful! Welcome #{@user.username}"
      redirect_to articles_path
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end