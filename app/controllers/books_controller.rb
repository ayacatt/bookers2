class BooksController < ApplicationController
  def new
    @book = Book.new
    @user = current_user.posts.build
  end

  def create
    @newbook = Book.new(book_params)
    @newbook.user_id = current_user.id
    if @newbook.save
      redirect_to book_path(@newbook.id), notice: 'You have created book successfully.'
    else
      @books = Book.all
      @user = current_user
      @users = User.all
      render :index
    end
  end

  def update
    @newbook = Book.find(params[:id])
    if @newbook.update(book_params)
      redirect_to book_path(@newbook.id), notice: 'You have updated book successfully.'
    else
      @users = User.all
      @user = current_user
      @books = Book.all
      render :edit
    end
  end

  def index
    @user = current_user
    @users = User.all
    @books = Book.all
    @newbook = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @users = User.all
    @newbook = Book.new
  end

  def edit
    @newbook = Book.find(params[:id])
    if @newbook.user == current_user
      render :edit
    else
      redirect_to books_path
    end  
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
