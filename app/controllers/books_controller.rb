class BooksController < ApplicationController
  before_action :authenticate_user!, except:[:top]
  def top
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book)
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @books = Book.all
    @user = User.find(params[:id])
  end

  def edit
   @book = Book.find(params[:id])
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
