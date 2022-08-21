class Admin::UsersController < ApplicationController
  before_action :autheniticate_admin

  def index
    @users = User.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book_shelf = @books.where(is_active: 'true')
    @book_deleted = @books.where(is_active: 'false')
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to admin_user_path(@user.id)
  end


  private


  def user_params
    params.require(:user).permit(:name, :email, :is_active, :image)
  end

end
