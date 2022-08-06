class Public::BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
   
    redirect_to "/"
  end

  def index
    @books = Book.all
  end

  def show
  end

  def edit
  end

  private


  def book_params
    params.require(:book).permit(:title, :body, :genre_id, :image, :star)
  end

end
