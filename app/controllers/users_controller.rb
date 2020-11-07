class UsersController < ApplicationController
 before_action :authenticate_user!
 before_action :correct_user, only: [:edit, :update]

  def show
   @book = Book.new
   @user = User.find(params[:id])
   @books = @user.books
   @currentUserEntry=Entry.where(user_id: current_user.id)
    @userEntry=Entry.where(user_id: @user.id)
    if @user.id == current_user.id
    else
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      if @isRoom
      else
        @room = Room.new
        @entry = Entry.new
      end
    end
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        NotificationMailer.complete_mail(@user).deliver_now
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
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
