class BooksController < ApplicationController
  before_action :authenticate_user!, except:[:top]
  def top
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id =current_user.id
    @book.save
    redirect_to books_path
  end

  def index
   @books =Book.all
  end

  def show
    @books =Book.fin(params[:id])
  end

  private
  def books_params
    params.require(:book).permit(:image)
  end
end
