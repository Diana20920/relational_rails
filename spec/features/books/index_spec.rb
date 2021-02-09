require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'I visit the books index page' do
    it 'displays each book with corresponding attributes' do
      hogwarts = Library.create!(name: 'Hogwarts', current_employees: 3)
      book1 = hogwarts.books.create!(title: 'Magic for Muggles', copies_available: 2, audio_book: true)
      book2 = hogwarts.books.create!(title: 'Advanced Spells', copies_available: 6, audio_book: true)

      visit '/books'

      expect(page).to have_content(book1.title)
      expect(page).to have_content(book1.copies_available)
      expect(page).to have_content(hogwarts.id)
      expect(page).to have_content(book2.title)
      expect(page).to have_content(book2.copies_available)
    end
  end
end
