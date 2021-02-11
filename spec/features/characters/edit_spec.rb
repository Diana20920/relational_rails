require 'rails_helper'

RSpec.describe 'Update character' do
  describe 'As a visitor' do
    describe 'when I visit the character show page' do
      it 'I see a link to update that character and its attributes' do
        great_gatsby = Novel.create!(title: 'The Great Gatsby', author: 'F. Scott Ftizgerald', number_of_chapters: 15)
        character = great_gatsby.characters.create!(name: 'Jay Gatsby', age: 28)

        visit "/characters/#{character.id}"
        expect(page).to have_link('Update Character')
        click_link 'Update Character'

        expect(current_path).to eq("/characters/#{character.id}/edit")
      end

      it 'displays a form to edit the character attributes' do
        great_gatsby = Novel.create!(title: 'The Great Gatsby', author: 'F. Scott Ftizgerald', number_of_chapters: 15)
        character = great_gatsby.characters.create!(name: 'Jay Gatsby', age: 28)

        visit "/characters/#{character.id}/edit"
        fill_in 'character[name]', with: 'Juan Gatsby'
        fill_in 'character[age]', with: 36
        click_button "Update"

        expect(current_path).to eq("/characters/#{character.id}")
        expect(page).to have_content('Juan Gatsby')
        expect(page).to have_content(36)
      end
    end
  end
end
