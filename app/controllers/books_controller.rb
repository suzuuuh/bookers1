class BooksController < ApplicationController
  def new
    @books=Books.new
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def create
    book = Book.new(book_params)
  if book.save
    redirect_to book_path(book.id), notice: 'Book was successfully created.'
  else
    render :new
  end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id), notice: 'Book was successfully updated.'
  end

  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    redirect_to '/books'  # 投稿一覧画面へリダイレクト
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end

