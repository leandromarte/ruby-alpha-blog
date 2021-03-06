class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :show, :destroy, :update]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  
  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end
  
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = User.first
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
    @article.user = User.first
    
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
  
  def require_same_user
    if (current_user != @article.user && (!current_user.admin?))
      flash[:danger] = "You cannot edit someone else's articles."
      redirect_to root_path
    end
  end

  private
  def set_article
    @article = Article.find(params[:id])
  end
  
  def article_params
    params.require(:article).permit(:title, :description, category_ids: [])
  end

end
