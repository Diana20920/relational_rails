require 'rails_helper'

RSpec.describe Book do
  describe 'relationships' do
    it { should belong_to :library }
  end

  describe "class methods" do
    describe "::all_true" do
      it "returns all records with audio_book column true" do
        hogwarts = Library.create!(name: 'Hogwarts', current_employees: 3)
        book1 = hogwarts.books.create!(title: 'Magic for Muggles', copies_available: 2, audio_book: true)
        book2 = hogwarts.books.create!(title: 'Advanced Spells', copies_available: 6, audio_book: true)
        book3 = hogwarts.books.create!(title: 'Negative Spells', copies_available: 8, audio_book: false)

        expect(Book.all_true.count).to eq(2)
      end
      it "returns no books if audio_book column is false" do
        hogwarts = Library.create!(name: 'Hogwarts', current_employees: 3)
        book1 = hogwarts.books.create!(title: 'Magic for Muggles', copies_available: 2, audio_book: false)
        book2 = hogwarts.books.create!(title: 'Advanced Spells', copies_available: 6, audio_book: false)
        book3 = hogwarts.books.create!(title: 'Negative Spells', copies_available: 8, audio_book: false)

        expect(Book.all_true.count).to eq(0)
      end
    end
  end
end