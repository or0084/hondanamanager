class Admin::BookCommentsController < ApplicationController
  before_action :autheniticate_admin

  def destroy
    BookComment.find(params[:id]).destroy
    redirect_to admin_book_path(params[:book_id])
  end

end
