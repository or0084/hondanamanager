class Public::UsersController < ApplicationController
  def show
    @user = User.find(current_user.id)
    @books = @user.books
    @book_shelf = @books.where(is_active: 'true')
    @book_deleted = @books.where(is_active: 'false')
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
    flash[:notice] = 'ユーザーの編集に成功しました！'
    redirect_to mypage_path
    else
    render 'edit'
    end
  end

  def unsubscribe
  end

  def withdraw
    @user = User.find(current_user.id)
    @user.update(is_active: true)
    reset_session
    redirect_to root_path
  end


  private


  def user_params
    params.require(:user).permit(:name, :email, :introduction, :image)
  end

end
