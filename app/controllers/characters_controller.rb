class CharactersController < ApplicationController
  def index
    @characters = Character.all
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
      novel_id: params[:character][:novel_id],
      name: params[:character][:name],
      antagonist: params[:character][:antagonist],
      age: params[:character][:age],
      updated_at: params[:character][:updated_at],
      created_at: params[:character][:created_at]
      })
    character.save
    redirect_to "/characters/#{character.id}"
  end
end
