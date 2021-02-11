  require 'rails_helper'

RSpec.describe Library do
  describe 'relationships' do
    it { should have_many :books }
  end

  describe "instance methods" do
    describe "#books_count" do
      it "returns a count of its books" do
        hogwarts = Library.create!(name: 'Hogwarts', current_employees: 3)
        book1 = hogwarts.books.create!(title: 'Magic for Muggles', copies_available: 2, audio_book: true)
        book2 = hogwarts.books.create!(title: 'Advanced Spells', copies_available: 6, audio_book: true)
        book3 = hogwarts.books.create!(title: 'Negative Spells', copies_available: 8, audio_book: false)

        expect(hogwarts.books_count).to eq(3)
      end

      it "returns 0 if library has no books" do
        hogwarts = Library.create!(name: 'Hogwarts', current_employees: 3)
        expect(hogwarts.books_count).to eq(0)
      end
    end
    describe "#given_limit" do
      it "returns a subset of books based on a given treshold for copies_available column" do
        hogwarts = Library.create!(name: 'Hogwarts', current_employees: 3)
        book1 = hogwarts.books.create!(title: 'Magic for Muggles', copies_available: 2, audio_book: true)
        book2 = hogwarts.books.create!(title: 'Advanced Spells', copies_available: 6, audio_book: true)
        book3 = hogwarts.books.create!(title: 'Negative Spells', copies_available: 8, audio_book: false)

        expect(hogwarts.given_limit(5).count).to eq(2)
        expect(hogwarts.given_limit(1).count).to eq(3)
      end

      it "returns no books if given treshold is more than copies_available" do
        hogwarts = Library.create!(name: 'Hogwarts', current_employees: 3)
        book1 = hogwarts.books.create!(title: 'Magic for Muggles', copies_available: 2, audio_book: true)
        book2 = hogwarts.books.create!(title: 'Advanced Spells', copies_available: 6, audio_book: true)
        book3 = hogwarts.books.create!(title: 'Negative Spells', copies_available: 8, audio_book: false)

        expect(hogwarts.given_limit(10).count).to eq(0)
      end
    end
  end

  describe "class methods" do
    describe "::sort_by_newest"  do
      it "orders libraries descending based on created_at attribute" do
        little_creek = Library.create!(name: 'Little Creek', current_employees: 20)
        hogwarts = Library.create!(name: 'Hogwarts', current_employees: 3)
        penli = Library.create!(name: 'PenLi', current_employees: 11)
        vbpl = Library.create!(name: 'VBPL', current_employees: 23)
        damneck = Library.create!(name: 'Damneck', current_employees: 8)
        portales = Library.create!(name: 'Portales', current_employees: 5)

        expect(Library.sort_by_newest.first).to eq(portales)
        expect(Library.sort_by_newest.last).to eq(little_creek)
      end
    end
  end
end
