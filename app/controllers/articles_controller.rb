class ArticlesController < ApplicationController
  # Does this action before anything else
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :require_login, except: [:show,:index] # Ensures a user is logged in to perform other actions except show and index
  before_action :require_same_user, only: [:edit, :update, :destroy] # Ensures a user can only edit, update or delete their own articles
  def show
  end

  def index
    # @articles = Article.all
    @articles = Article.paginate(page: params[:page], per_page: 5)

  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    # render plain: params[:article]
    @article = Article.new(article_params) # This is whitelisting the top level key :article, and it's containing data :title and :description
    # render plain: @article.inspect # To view entered article
    
    # Assigning a new user to the article to test the association and give illusion of authentication
    # This is for testing purposes only, in a real application, the user would be assigned automatically
    @article.user = current_user

    if @article.save
      # redirect_to article_path(@article) # Redirect show page
      flash[:notice] = "Article was created successfully" # A flash message, there is also :alert type
      redirect_to @article # Redirect show page, more concise
    else
      render :new
    end
  end

  def update
    if @article.update(article_params) # This is whitelisting the top level key :article, and it's containing data :title and :description
      flash[:notice] = "Article was updated successfully" # A flash message, there is also :alert type
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end

  # This is defined in the articles controller because it's only used in the articles controller
  def require_same_user
    if current_user != @article.user && !current_user.admin?
      flash[:alert] = "You can only perform that action on your own article"
      redirect_to @article
    end
  end
end