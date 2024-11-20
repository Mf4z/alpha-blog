class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    # render plain: params[:article]
    @article = Article.new(params.require(:article).permit(:title, :description)) # This is whitelisting the top level key :article, and it's containing data :title and :description
    # render plain: @article.inspect # To view entered article
    
    if @article.save
      # redirect_to article_path(@article) # Redirect show page
      flash[:notice] = "Article was created successfully" # A flash message, there is also :alert type
      redirect_to @article # Redirect show page, more concise
    else
      render :new
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(params.require(:article).permit(:title, :description)) # This is whitelisting the top level key :article, and it's containing data :title and :description
      flash[:notice] = "Article was updated successfully" # A flash message, there is also :alert type
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end
end