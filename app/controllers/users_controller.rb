class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
    @book = Book.new
    @user = User.new
  end

  def show
     @user = User.find(params[:id])
     @book = Book.new
     @books = @user.books.page(params[:page]).reverse_order
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def edit
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end