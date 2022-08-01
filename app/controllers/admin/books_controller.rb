class Admin::BooksController < ApplicationController
  def index
    @books = Book.page(params[:page])
  end

  def show
    @book = Book.find(params[:id])
    @books = @book.user
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to admin_books_path
  end

end
