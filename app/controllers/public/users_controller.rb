class Public::UsersController < ApplicationController
  def show
    @user = User.find(current_user.id)
    @books = @user.books
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    @user.update(user_params)
    redirect_to mypage_path
  end


  private


  def user_params
    params.require(:user).permit(:name, :email, :introduction, :image)
  end

end
