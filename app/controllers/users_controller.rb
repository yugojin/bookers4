class UsersController < ApplicationController
 before_action :authenticate_user!

  def top
  end

  def show
   @book = Book.new
   @user = User.find(params[:id])
   @books = @user.books
  end

  def create
   @book = Book.new(book_params)
   @book.save
   redirect_to book_path
  end

  def edit
   @user = User.find(params[:id])
  end

  def index
   @book = Book.new
   @users = User.all
   @user = current_user
  end

  def update
   @user = User.find(params[:id])
   if @user.update(user_params)
     redirect_to user_path()
   else
     render :edit
   end
  end
  
  private
  def user_params
   params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
