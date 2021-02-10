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

    it "displays the records with audio_book as true" do
      hogwarts = Library.create!(name: 'Hogwarts', current_employees: 3)
      book1 = hogwarts.books.create!(title: 'Magic for Muggles', copies_available: 2, audio_book: true)
      book2 = hogwarts.books.create!(title: 'Advanced Spells', copies_available: 6, audio_book: true)
      book3 = hogwarts.books.create!(title: 'Negative Spells', copies_available: 8, audio_book: false)

      visit "/books"

      expect(page).to have_content(book1.title)
      expect(page).to have_content(book2.title)
      expect(page).to_not have_content(book3.title)
    end
  end

  describe "I visit the library's books page" do
    it 'shows all the books for that library' do
      little_creek = Library.create!(name: 'Little Creek', current_employees: 20)
      hogwarts = Library.create!(name: 'Hogwarts', current_employees: 3)

      book1 = little_creek.books.create!(title: 'Ruby', copies_available: 3)
      book2 = little_creek.books.create!(title: 'Coding for Dummies', copies_available: 20)

      book3 = hogwarts.books.create!(title: 'Magic for Muggles', copies_available: 2)
      book4 = hogwarts.books.create!(title: 'Advanced Spells', copies_available: 6)

      visit "/libraries/#{little_creek.id}/books"

      expect(page).to have_content(book1.title)
      expect(page).to have_content(book1.copies_available)
      expect(page).to have_content(little_creek.id)
      expect(page).to have_content(book2.title)
      expect(page).to have_content(book2.copies_available)
      expect(page).to_not have_content(book3.title)
      expect(page).to_not have_content(book4.title)
    end

    it "returns records over a given treshold by inputing into a form" do
      little_creek = Library.create!(name: 'Little Creek', current_employees: 20)
      book1 = little_creek.books.create!(title: 'Ruby', copies_available: 3)
      book2 = little_creek.books.create!(title: 'Coding for Dummies', copies_available: 20)

      visit "/libraries/#{little_creek.id}/books"

      fill_in "copies[number]", with: 10
      click_button "Only return books with more than amount of copies available"

      expect(page).to have_content(book2.title)
      expect(page).to_not have_content(book1.title)
    end
  end
end
