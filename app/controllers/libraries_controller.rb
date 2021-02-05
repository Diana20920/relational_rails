class LibrariesController < ApplicationController
  def index
    @libraries = Library.all
  end

  def new

  end

  def create
    library = Library.new({
      name: params[:library][:name],
      online_membership: params[:library][:online_membership],
      current_employees: params[:library][:current_employees],
      created_at: params[:library][:created_at],
      updated_at: params[:library][:updated_at]
      })
      library.save
      redirect_to '/libraries'
  end

  def show
    @library = Library.find(params[:id])
  end

  def edit
    @library = Library.find(params[:id])
  end

  def update
    library = Library.find(params[:id])
    library.update({
      name: params[:library][:name],
      online_membership: params[:library][:online_membership],
      current_employees: params[:library][:current_employees],
      created_at: params[:library][:created_at],
      updated_at: params[:library][:updated_at]
      })
      library.save
      redirect_to "/libraries/#{library.id}"
  end

  def destroy
    Library.destroy(params[:id])
    redirect_to '/libraries'
  end

  def books_index
    @library = Library.find(params[:id])
    @library_books = @library.books
  end
end