class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "Book added!"
      redirect_to "/"
    else
      flash[:alert] = "There was a problem adding your book. Please try again."
      redirect_to :back
    end
  end

  private

  def book_params
    params.require(:book).permit(:name, :author, :photo)
  end

end
