class Admin::UsersController < ApplicationController
  def index
    @users = User.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end
  
  private
  
  
  def user_params
    params.require(:customer).permit(:name, :email, :is_active, :image)
  end
end
