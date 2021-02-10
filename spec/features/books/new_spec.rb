require 'rails_helper'

RSpec.describe 'New Library Book' do
  describe 'as a visitor' do
    describe "when I visit that library's books index page" do
      it 'I can create a new book for that library' do
        penli = Library.create!(name: 'PenLi', current_employees: 11)

        visit "/libraries/#{penli.id}/books"
        click_link "Create Book"
        expect(current_path).to eq("/libraries/#{penli.id}/books/new")

        fill_in 'book[title]', with: 'Animal Advocacy'
        fill_in 'book[copies_available]', with: 21

        click_on 'Create Book'

        expect(current_path).to eq("/libraries/#{penli.id}/books")
        expect(page).to have_content('Animal Advocacy')
        expect(page).to have_content(21)
      end
    end
  end
end
