class Public::BooksController < ApplicationController
  before_action :autheniticate_user, only: [:create, :edit, :update]

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    tag_list = params[:book][:tag_ids].split(',')
    if @book.save
      @book.save_tags(tag_list)
      flash[:notice] = '本棚に追加しました！'
      redirect_to user_path(@book.user.id)
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
    if @book.user_id != current_user.id
      redirect_to books_path
    end
    @tag_list = @book.tags.pluck(:name).join(',')
  end

  def update
    @book = Book.find(params[:id])
    tag_list = params[:book][:tag_ids].try(:split, ',')
   if @book.user_id = current_user.id
     if @book.update(book_params)
      @book.save_tags(tag_list)
      flash[:notice] = '投稿の編集に成功しました！'
      redirect_to book_path(@book.id)
     else
      render 'edit'
     end
   end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      flash[:notice] = '投稿を削除しました！'
      redirect_to user_path(@book.user.id)
    else
      render 'show'
    end
  end


  private


  def book_params
    params.require(:book).permit(:title, :body, :genre_id, :image, :star, :is_active)
  end

end
