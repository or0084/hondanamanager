class Admin::BookCommentsController < ApplicationController

  def destroy
    BookComment.find(params[:id]).destroy
    redirect_to admin_book_path(params[:book_id])
  end
end
