class CategoriesController < ApplicationController
  # before_action :require_admin, except: [:index, :show]
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index 
    @categories = Category.paginate(page: params[:page], per_page: 4)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(cat_params)
    if @category.save
      flash[:notice] = "Category Added"
      redirect_to category_path(@category)
    else
      flash[:notice] = "try that again!"
      render 'new'
    end
  end

  def show
    
    @articles = @category.articles.paginate(page: params[:page], per_page: 2)
  end

  def edit 
    
  end

  def update 
    
    if @category.updste(category_params)
      flash[:notice] = "Category has been Updated"
      redirect_to category_path(@category)
    else
      render 'edit'
    end
  end

  def destroy 
    @category.destroy
    flash[:notice] = "Category Has been Deleted"
    redirect_to categories_path
  end
    
  
  private

  def cat_params 
    params.require(:category).permit(:name)
  end

  def set_category 
    @category = Category.find(params[:id])
  end

  def require_admin
    if !(logged_in? && current_user.admin?)
      flash[:alert] = "Only Admins can perform that action"
      redirect_to categories_path
    end
  end
  
end