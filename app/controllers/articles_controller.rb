class ArticlesController < ApplicationController
  # Does this action before anything else
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def show
  end

  def index
    @articles = Article.all
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
    @article.user = User.first

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
end