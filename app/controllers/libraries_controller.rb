class LibrariesController < ApplicationController
  def index
    @libraries = ['Library 1', 'Library 2', 'Library 3']
  end

  def new

  end
end