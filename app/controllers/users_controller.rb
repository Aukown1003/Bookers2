class UsersController < ApplicationController
  # ログインしていなければlog_inにリダイレクト
  before_action :authenticate_user!

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
    user_id = params[:id].to_i
    if user_id != current_user.id
      redirect_to user_path(current_user.id)
    end
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "user_edit successfully"
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def user_params
    params.require(:user).permit(:name,:introduction,:profile_image)
  end
end
