class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @newbook = Book.new(book_params)
    @newbook.user_id = current_user.id
    if @newbook.save
      redirect_to books_path
    else
      render :new
    end
  end

  def index
    @books = Book.all
    @user = current_user
    @users = User.all
    @newbook = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @user = current_user
    @users = User.all
    @newbook = Book.new
  end

  def destroy
    list = Book.find(params[:id]) 
    list.destroy
    redirect_to books_path 
  end
  
  private

  def book_params
    params.require(:book).permit(:title, :opinion)
  end
end
