class UsersController < ApplicationController

  before_action :set_user, only: [:edit, :update, :show, :destroy]
  before_action :current_user, only: [:edit, :update, :destroy]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  
  def index
    # @users = User.all
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  def new
    @user = User.new
  end

  def edit
  end

  def show
    @articles = @user.articles.paginate(page: params[:page], per_page: 3)
  end

  def create
    # byebug  - stop the code here and check the params
    # params - to check the params
    # prams[:user][:username] - to check the username for example
    
    # Create user
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id # Store user id in session
      flash[:notice] = "Signup Successful! Welcome #{@user.username}"
      redirect_to articles_path
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "User was updated successfully"
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    session[:user_id] = nil if @user == current_user # Clear session if user is deleted, and check if user is current user, in the case of admin deleting another user
    flash[:notice] = "Account and all your articles have been deleted"
    redirect_to articles_path
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    if current_user != @user && !current_user.admin?
      flash[:alert] = "You can only perform that action on your own profile"
      redirect_to @user
    end
  end
end