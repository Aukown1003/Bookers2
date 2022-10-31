class UsersController < ApplicationController
  def index
    @users = User.all
    # user info用のuserデータの受け渡し
    @user = User.find(current_user.id)
  end

  def show
    @user = User.find(params[:id])
    # userの投稿データの
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
