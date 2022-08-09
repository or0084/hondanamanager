class Admin::BooksController < ApplicationController
  def index
    @books = Book.page(params[:page])
  end

  def show
    @book = Book.find(params[:id])
    @user_book = @book.user
    @books = @book.book_comments
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to admin_books_path
  end

end
