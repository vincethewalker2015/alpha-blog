class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @articles = Article.all
    @articles = Article .paginate(page: params[:page], per_page: 3)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      flash.now[:notice] = "Article has been saved"
    redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def show
   
  end

  def edit
    
  end

  def update
    
    if @article.update(article_params)
      flash[:notice] = "Article has been updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def destroy
    
    @article.destroy
    flash[:notice] = "Article has been deleted"
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :description, category_ids: [])
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def require_same_user
    if current_user != @article.user and !current_user.admin?
      flash[:notice] = "You can only Edit or Delete your own Article"
      redirect_to @article
    end
  end

end
