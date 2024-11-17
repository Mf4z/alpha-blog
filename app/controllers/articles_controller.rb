class ArticlesController < ApplicationController
  def show
    # byebug
    @articles = Article.find(params[:id])
  end
end