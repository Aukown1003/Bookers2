class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user_id = params[:id].to_i
    login_user.id = current_user.id
    if user_id != current_user.id
      redirect_to user_path(current_user.id)
    end
    @user = User.find(params[:id])
    @user.update
    redirect_to user_path(@user.id)
  end
end
