class NovelsController < ApplicationController
  def index
    @novels = Novel.sort_by_newest
  end

  def new

  end

  def create
    novel = Novel.new({
      title: params[:novel][:title],
      author: params[:novel][:author],
      hard_cover: params[:novel][:hard_cover],
      number_of_chapters: params[:novel][:number_of_chapters],
      created_at: params[:novel][:created_at],
      updated_at: params[:novel][:updated_at]
      })
      novel.save
      redirect_to '/novels'
  end

  def show
    @novel = Novel.find(params[:id])
    @novel_characters_count = @novel.characters_count
  end

  def edit
    @novel = Novel.find(params[:id])
  end

  def update
    novel = Novel.find(params[:id])
    novel.update({
      title: params[:novel][:title],
      author: params[:novel][:author],
      hard_cover: params[:novel][:hard_cover],
      number_of_chapters: params[:novel][:number_of_chapters],
      created_at: params[:novel][:created_at],
      updated_at: params[:novel][:updated_at]
      })
      novel.save
      redirect_to "/novels/#{novel.id}"
  end

  def destroy
    Novel.destroy(params[:id])
    redirect_to '/novels'
  end

  # def characters_index
  #   @novel = Novel.find(params[:id])
  #   @novel_characters = @novel.characters
  # end
end
