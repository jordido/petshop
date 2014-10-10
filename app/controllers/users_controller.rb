class UsersController < ApplicationController
  before_action :check_admin, only: [:edit, :create, :destroy, :new]
  
  def index
    @users = User.all
  end

  def new
    @user = User.new
    @user.name = ""
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save # will check password match   
       # User has been created          
       # Log them in automatically        
      session[:user_id] = @user.id    
      redirect_to users_url
    else
      render 'new'
    end
  end    

  def update
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_url
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
