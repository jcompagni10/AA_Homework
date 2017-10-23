class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    render :new
  end

  def create
    book = Book.new(book_params)
    if book.save
      redirect_to action: :index
    else
      fail "nah brah"
    end
  end

  def destroy
    if Book.delete(params[:id]) == 1
      redirect_to action: :index
    else
      fail 'nah'
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
