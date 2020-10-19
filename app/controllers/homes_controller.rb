class HomesController < ApplicationController
  before_action :authenticate_user!,
  def index
   @book = Book.new
   @books = Book.all
  end

  def create
   @book = Book.new(book_params)
   @book.save
   redirect_to books_path
  end
end
