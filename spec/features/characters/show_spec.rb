require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'I visit the characters show page' do
    it 'displays the one characters and its attributes' do
      moby_dick = Novel.create!(title: 'Moby Dick', author: 'Herman Melville', number_of_chapters: 7)
      char1 = moby_dick.characters.create(name: 'Captain Ahab', age: 45)

      visit "/characters/#{char1.id}"

      expect(page).to have_content(char1.name)
      expect(page).to have_content(char1.age)
    end

    it 'has link to delete the character' do
      moby_dick = Novel.create!(title: 'Moby Dick', author: 'Herman Melville', number_of_chapters: 7)
      char1 = moby_dick.characters.create(name: 'Captain Ahab', age: 45)

      visit "/characters/#{char1.id}"
      click_link "Delete Character"

      expect(current_path).to eq('/characters')
      expect(page).to_not have_content(char1.name)
      expect(page).to_not have_content(char1.age)
    end
  end
end
