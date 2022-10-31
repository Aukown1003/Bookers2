class BooksController < ApplicationController
  def index
    # user info用のuserデータの受け渡し
    @user = User.find(current_user.id)
    @books = Book.all
  end
  
  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
  end
  
  def destroy
  end
  
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
