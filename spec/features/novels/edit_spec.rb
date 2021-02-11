require 'rails_helper'

RSpec.describe 'Edit Novel', type: :feature do
  describe "As a visitor" do
    describe "When I visit the edit novel form by clicking a link on the novel show page" do
      it "I can edit novel attributes" do
        great_gatsby = Novel.create!(title: 'The Great Gatsby', author: 'F. Scott Ftizgerald', number_of_chapters: 15)

        visit "/novels/#{great_gatsby.id}"
        click_link "Update Novel"

        expect(current_path).to eq("/novels/#{great_gatsby.id}/edit")

        fill_in 'novel[title]', with: 'Hello World'
        fill_in 'novel[number_of_chapters]', with: 22
        click_button "Update"

        expect(current_path).to eq("/novels/#{great_gatsby.id}")
        expect(page).to have_content('Hello World')
        expect(page).to have_content(22)
      end
    end
  end
end
