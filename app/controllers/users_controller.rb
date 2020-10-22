class UsersController < ApplicationController
 before_action :authenticate_user!
 before_action :correct_user, only: [:edit, :update]

  def show
   @book = Book.new
   @user = User.find(params[:id])
   @books = @user.books
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
     flash[:notice] = "You have update Book successfully"
     redirect_to user_path(current_user)
   else
     render :edit
   end
  end

  private
  def user_params
   params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def correct_user
     @user = User.find(params[:id])
     if current_user != @user
       redirect_to user_path(current_user)
     end
  end

end
