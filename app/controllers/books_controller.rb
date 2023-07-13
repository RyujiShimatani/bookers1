class BooksController < ApplicationController
  def new
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to '/books'
      flash[:notice] = "投稿が成功しました,successfully"
    else
      @books = Book.all
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id)
      flash[:notice] = "編集が成功しました,successfully"
    else
      render :edit
    end

  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      redirect_to '/books'
      flash[:notice] = "Book was successfully destroyed."
    else
      redirect_to '/books'
    end
    
  end

  # def destroy
  #   book = Book.find(params[:id])
  #   book.destroy
  #   redirect_to '/books'
  # end
  
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
