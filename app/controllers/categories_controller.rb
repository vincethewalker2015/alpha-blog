class CategoriesController < ApplicationController
  # before_action :require_admin, except: [:index, :show]

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
    @category = Category.find(params[:id])
  end

  def index 
    @categories = Category.paginate(page: params[:page], per_page: 4)
  end
    
  
  private

  def cat_params 
    params.require(:category).permit(:name)
  end

  def require_admin
    if !(logged_in? && current_user.admin?)
      flash[:alert] = "Only Admins can perform that action"
      redirect_to categories_path
    end
  end
  
end