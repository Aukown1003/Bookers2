class BooksController < ApplicationController
  # ログインしていなければlog_inにリダイレクト
  before_action :authenticate_user!
  
  def index
    # user info用のuserデータの受け渡し
    @user = User.find(current_user.id)
    @books = Book.all
    @book = Book.new
  end
  
  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "book_create successfully"
      redirect_to book_path(@book.id)
    else
      @user = User.find(current_user.id)
      @books = Book.all
      render :index
    end
  end
  
  def edit
    @book = Book.find(params[:id])
    user_id = @book.user.id
    # params[:id].to_iは本の情報を取得している
    # user_id = params[:id].to_i　本の情報とユーザーのIDを一致させるのはおかしい
    if user_id != current_user.id
      redirect_to books_path
    end
    @book = Book.find(params[:id])
    # @book = Book.find(current_user.id)
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "book_edit successfully"
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end
  
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
