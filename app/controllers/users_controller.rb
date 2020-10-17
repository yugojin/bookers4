class UsersController < ApplicationController
 before_action :authenticate_user!

  def top
  end

  def about
  end

  def show
   @book = Book.new
   @user = User.find(params[:id])
   @books = Book.all
  end

  def create
   @book = Book.new(book_params)
   @book.save
   redirect_to books_path
  end

  def edit
   @user = User.find(params[:id])
  end

  def index
   @user = User.find(params[:id])
  end

  def update
   @user = User.find(params[:id])
   if @user.update(user_params)
     redirect_to user_path(@user)
   else
     render :edit
   end
  end

  private
  def user_params
   params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
