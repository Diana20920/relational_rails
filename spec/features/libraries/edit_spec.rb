require 'rails_helper'

RSpec.describe 'Edit Library', type: :feature do
  describe "As a visitor" do
    describe "When I visit the edit library form by clicking a link on the library show page" do
      it "I can edit library attributes" do
        hogwarts = Library.create!(name: 'Hogwarts', current_employees: 3, online_membership: true)
        visit "/libraries/#{hogwarts.id}"

        click_link "Update Library"

        expect(current_path).to eq("/libraries/#{hogwarts.id}/edit")

        fill_in 'library[name]', with: 'hello'
        fill_in 'library[current_employees]', with: 5

        click_button "Update"

        expect(current_path).to eq("/libraries/#{hogwarts.id}")
        expect(page).to have_content('hello')
        expect(page).to have_content(5)
      end
    end
  end
end