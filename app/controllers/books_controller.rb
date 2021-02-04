class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update({
      library_id: params[:book][:library_id],
      title: params[:book][:title],
      audio_book: params[:book][:audio_book],
      copies_available: params[:book][:copies_available],
      updated_at: params[:book][:updated_at],
      created_at: params[:book][:created_at]
      })
    book.save
    redirect_to "/books/#{book.id}"
  end

  def destroy
    Book.destroy(params[:id])
    redirect_to '/books'
  end
end
