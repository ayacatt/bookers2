class UsersController < ApplicationController
  def index
    @user = current_user
    @users = User.all
    
  end
  
  def show
    @user = User.find(params[:id])
    @users = User.all
    @book = Book.where(user_id: @user.id)
    @newbook = Book.new
    
  end
  
  def edit
    @user = User.find(params[:id])
    if @user.save
      redirect_to user_path
    else
      render :new
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
end
