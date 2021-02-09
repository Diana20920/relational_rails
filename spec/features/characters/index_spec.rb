require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'I visit the characters index page' do
    it 'displays each character with corresponding attributes' do

      tlotr = Novel.create!(title: 'The Lord of the Rings', author: 'J. R. R. Tolkien', number_of_chapters: 60)
      char1 = tlotr.characters.create!(name: 'Gollum', age: 15, antagonist: true)
      char2 = tlotr.characters.create!(name: 'Legolas', age: 200, antagonist: true)

      visit '/characters'

      expect(page).to have_content(char1.name)
      expect(page).to have_content(char1.age)
      expect(page).to have_content(tlotr.id)
      expect(page).to have_content(char2.name)
      expect(page).to have_content(char2.age)
    end
  end
end
