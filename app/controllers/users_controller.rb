class UsersController < ApplicationController
  def index
    @user = current_user
    @users = User.all
    @newbook = Book.new
  end
  
  def show
    @user = User.find(params[:id])
    @users = User.all
    @books = Book.where(user_id: @user.id)
    @newbook = Book.new
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user.id)
    else
      render :edit
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
end
