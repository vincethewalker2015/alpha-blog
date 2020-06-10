class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
    @articles = Article .paginate(page: params[:page], per_page: 3)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = User.first
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
    params.require(:article).permit(:title, :description)
  end

  def set_article
    @article = Article.find(params[:id])
  end

end
