class BooksController < ApplicationController
  def index
    @books = Book.order(:position)
  end

  
  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create 
    @book = Book.new(params.require(:book).permit(:name, :position, :read, :description))
    if @book.save
      redirect_to books_path
    else
      render('new')
    end
  end

  def edit
    @book = Book.find(params[:id])

  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to books_path(@book)
    else
      render('edit')
    end
  end

  def delete
    @book = Book.find(params[:id])
  end

  def destroy 
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private 
  def book_params
    params.require(:book).permit(:name, :position, :read, :description)
  end
end
