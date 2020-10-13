class UsersController < ApplicationController
 before_action :correct_user, only: [:edit, :update]
  before_action :authenticate_user!

  def top
  end

  def about
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
  end

  def edit
  end

  def index
  end

  def update
  end

end
