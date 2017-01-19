class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :show, :destroy, :update]
  
  
  def index
    @articles = Article.all
  end
  
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = "New article created"
      redirect_to article_path(@article)
    else 
      render "new"
    end
  end
  
  def edit

  end
  
  def update
    if @article.save
      flash[:success] = "Article successfully edited"
      redirect_to article_path(@article)
    else 
      render "edit"
    end
  end
  
  def destroy
    @article.destroy
    
    flash[:danger] = "Article deleted."
    redirect_to articles_path
  end
  
  def show

  end

  private
  def set_article
    @article = Article.find(params[:id])
  end
  
  def article_params
    params.require(:article).permit(:title, :description)
  end

end
