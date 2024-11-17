class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def new
    
  end

  def create
    # render plain: params[:article]
    @article = Article.new(params.require(:article).permit(:title, :description)) # This is whitelisting the top level key :article, and it's containing data :title and :description
    # render plain: @article.inspect # To view entered article
    
    if @article.save
      # redirect_to article_path(@article) # Redirect show page
      redirect_to @article # Redirect show page, more concise
    else
      render :new
    end
  end

end