require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'I visit the book show page' do
    it 'displays the one book and its attributes' do
      little_creek = Library.create!(name: 'Little Creek', current_employees: 20)

      book2 = little_creek.books.create!(title: 'Coding for Dummies', copies_available: 20)

      visit "/books/#{book2.id}"

      expect(page).to have_content(book2.title)
      expect(page).to have_content(book2.copies_available)
    end

    it 'has link to delete the book' do
      little_creek = Library.create!(name: 'Little Creek', current_employees: 20)
      book2 = little_creek.books.create!(title: 'Coding for Dummies', copies_available: 20)

      visit "/books/#{book2.id}"

      click_link "Delete Book"

      expect(current_path).to eq('/books')
      expect(page).to_not have_content(book2.title)
      expect(page).to_not have_content(book2.copies_available)
    end
  end
end
