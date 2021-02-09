require 'rails_helper'

RSpec.describe 'New Library', type: :feature do
  describe 'As a visitor' do
    describe 'When I visit the new library form by clicking a link on the index' do
      it 'I can create a new library' do

        visit '/libraries'
        click_link "New Library"
        expect(current_path).to eq("/libraries/new")

        fill_in 'library[name]', with: 'Library1'
        fill_in 'library[current_employees]', with: 5

        click_on "Create Library"

        expect(current_path).to eq("/libraries")
        expect(page).to have_content('Library1')
      end
    end
  end
end