class UsersController < ApplicationController
  def index
    @users = User.all
    @user = current_user
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
    if @user != current_user
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user.id), notice: 'You have updated user successfully.'
    else
      render :edit
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
end
