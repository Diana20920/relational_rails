class NovelsController < ApplicationController
  def index
    @novels = ['novel 1', 'novel 2', 'novel 3']
  end

  def new

  end
end