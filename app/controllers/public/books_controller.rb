class Public::BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    tag_list = params[:book][:tag_ids].split(',')
    if @book.save
      @book.save_tags(tag_list)
      flash[:success] = '投稿しました！'
      redirect_to user_path(@book.id)
    else
      render 'new'
    end
  end

  def index
    @tags = Tag.all
    @books = params[:tag_id].present? ? Tag.find(params[:tag_id]).books : Book.all
  end

  def search
    @books = Book.search(params[:keyword])
    @keyword = params[:keyword]
    render "index"
  end

  def show
    @book = Book.find(params[:id])
    @book_comment = BookComment.new
  end

  def edit
    @book = Book.find(params[:id])
    @tag_list = @book.tags.pluck(:name).join(',')

  end

  def update
    @book = Book.find(params[:id])
    tag_list = params[:book][:tag_ids].try(:split, ',')
    if @book.update(book_params)
      @book.save_tags(tag_list)
      flash[:success] = '投稿を編集しました'
      redirect_to book_path(@book.id)
    else
      render 'edit'
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to user_path(@book.id)
  end


  private


  def book_params
    params.require(:book).permit(:title, :body, :genre_id, :image, :star, :is_active, tag_ids: [:name])
  end

end
