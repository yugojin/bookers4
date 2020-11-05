class BookCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    book = Book.find(params[:book_id])
    comment = current_user.book_comment.new(book_comment_params)
    comment.book_id = book.id
    if comment.save
    redirect_to request.referer
    else
    render 'books/show'
    end
  end

  def destroy
    BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
    redirect_to request.referer
  end

  private
  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
