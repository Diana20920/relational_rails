class BooksController < ApplicationController
  def index
    if params[:sort]
      @library = Library.find(params[:format])
      @books = @library.books.order(params[:sort])
    elsif params[:id].nil?
      @books = Book.all_true
    elsif params[:id] && !params.keys.include?("copies")
      @library = Library.find(params[:id])
      @books = @library.books
    else
      @library = Library.find(params[:id])
      @books = @library.given_limit(params[:copies][:number])
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

  def new

  end

  def create
    library = Library.find(params[:id])
    book = library.books.new({
      title: params[:book][:title],
      audio_book: params[:book][:audio_book],
      copies_available: params[:book][:copies_available],
      updated_at: params[:book][:updated_at],
      created_at: params[:book][:created_at]
      })
      book.save
      redirect_to "/libraries/#{book.library_id}/books"
  end
end
