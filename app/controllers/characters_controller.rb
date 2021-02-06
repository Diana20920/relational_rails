class CharactersController < ApplicationController
  def index
    if params[:id].nil?
      @characters = Character.all_true
    else
      @novel = Novel.find(params[:id])
      @characters = @novel.characters
    end
  end

  def show
    @character = Character.find(params[:id])
  end

  def edit
    @character = Character.find(params[:id])
  end

  def update
    character = Character.find(params[:id])
    character.update({
      name: params[:character][:name],
      antagonist: params[:character][:antagonist],
      age: params[:character][:age],
      updated_at: params[:character][:updated_at],
      created_at: params[:character][:created_at]
      })
    character.save
    redirect_to "/characters/#{character.id}"
  end

  def destroy
    Character.destroy(params[:id])
    redirect_to '/characters'
  end

  def new

  end

  def create
    novel = Novel.find(params[:id])
    character = novel.characters.new({
      name: params[:character][:name],
      antagonist: params[:character][:antagonist],
      age: params[:character][:age],
      updated_at: params[:character][:updated_at],
      created_at: params[:character][:created_at]
      })
    character.save
    redirect_to "/novels/#{character.novel_id}/characters"
  end
end
