class Public::BookCommentsController < ApplicationController
  before_action :autheniticate_user

  def create
    book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(book_comment_params)
    comment.book_id = book.id
    if comment.save
     redirect_to book_path(book)
    else
     @book = Book.find(params[:book_id])
     @book_comment = BookComment.new
     render "public/books/show"
    end
  end

  def destroy
    BookComment.find(params[:id]).destroy
    redirect_to book_path(params[:book_id])
  end


  private


  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
