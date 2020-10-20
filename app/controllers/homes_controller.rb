class HomesController < ApplicationController
  before_action :authenticate_user!, except:[:top]
  def top
   @book = Book.new
   @books = Book.all
  end

  def about
  end

  def create
   @book = Book.new(book_params)
   @book.save
   redirect_to books_path
  end
end
