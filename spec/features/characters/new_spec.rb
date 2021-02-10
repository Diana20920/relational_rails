require 'rails_helper'

RSpec.describe 'New Novel Character' do
  describe 'as a visitor' do
    describe "when I visit that novel's characters index page" do
      it 'I can create a new character for that novel' do
        animal_farm = Novel.create!(title: 'Animal Farm', author: 'George Orwell', number_of_chapters:12)

        visit "/novels/#{animal_farm.id}/characters"
        click_link "Create Character"
        expect(current_path).to eq("/novels/#{animal_farm.id}/characters/new")

        fill_in 'character[name]', with: 'Jesus Biogigigraphy'
        fill_in 'character[age]', with: 21

        click_on 'Create Character'

        expect(current_path).to eq("/novels/#{animal_farm.id}/characters")
        expect(page).to have_content('Jesus Biogigigraphy')
        expect(page).to have_content(21)
      end
    end
  end
end
