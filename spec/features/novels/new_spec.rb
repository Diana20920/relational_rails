require 'rails_helper'

RSpec.describe 'New Novel', type: :feature do
  describe 'As a visitor' do
    describe 'When I visit the new novel form by clicking a link on the index' do
      it 'I can create a new novel' do

        visit '/novels'
        click_link "New Novel"
        expect(current_path).to eq("/novels/new")

        fill_in 'novel[title]', with: 'Novel1'
        fill_in 'novel[number_of_chapters]', with: 33

        click_on "Create Novel"

        expect(current_path).to eq("/novels")
        expect(page).to have_content('Novel1')
      end
    end
  end
end