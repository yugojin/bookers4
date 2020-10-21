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
   if @book.save
    flash[:notice] = "You have create book successfully"
    redirect_to user_path(current_user)
   else
    render :index
   end
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
     flash[:notice] = "You have update user successfully"
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
