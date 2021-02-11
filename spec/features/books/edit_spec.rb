require 'rails_helper'

RSpec.describe 'Update book' do
  describe 'As a visitor' do
    describe 'when I visit the book show page' do
      it 'I see a link to update that book and its attributes' do
        portales = Library.create!(name: 'Portales', current_employees: 5)
        book = portales.books.create!(title: 'French 201', copies_available: 20)

        visit "/books/#{book.id}"
        expect(page).to have_link('Update Book')
        click_link 'Update Book'

        expect(current_path).to eq("/books/#{book.id}/edit")
      end

      it 'displays a form to edit the book attributes' do
        portales = Library.create!(name: 'Portales', current_employees: 5)
        book = portales.books.create!(title: 'French 201', copies_available: 20)

        visit "/books/#{book.id}/edit"
        fill_in 'book[title]', with: 'German 202'
        fill_in 'book[copies_available]', with: 10
        click_button "Update"

        expect(current_path).to eq("/books/#{book.id}")
        expect(page).to have_content('German 202')
        expect(page).to have_content(10)
      end
    end
  end
end
