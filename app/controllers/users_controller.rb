class UsersController < ApplicationController
  before_action :require_user, except: [:new, :create]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index 
    @users = User.paginate(page: params[:page], per_page: 2)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Hey #{@user.username}!, You are all set up :)"
      redirect_to root_path
    else
      flash[:notice] = "There was an Error.. Please try again"
      render 'new'
    end
  end

  def show
    # @articles = @user.articles
    @articles = @user.articles.paginate(page: params[:page], per_page: 2)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash.now[:notice] = "Profile Updated"
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    flash[:notice] = "User has been deleted"
    redirect_to root_path
  end


  private 

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end