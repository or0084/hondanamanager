class Admin::BooksController < ApplicationController
  def index
    @books = Book.page(params[:page])
  end

  def show
  end
end
