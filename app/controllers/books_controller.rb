class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end

  def index
    @books = Book.page(params[:page]).reverse_order
  end

  def show
    @book = Book.find(params[:id])
    @books = @user.books.page(params[:page]).reverse_order
  end

  def destroy
  end
  
  private

  def book_params
    params.permit(:title, :opinion)
  end
end
