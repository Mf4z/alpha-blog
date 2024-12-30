class UsersController < ApplicationController

  before_action :set_user, only: [:edit, :update, :show, :destroy]
  
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
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end