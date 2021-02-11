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

    it "displays the records with antagonist as true" do
      tlotr = Novel.create!(title: 'The Lord of the Rings', author: 'J. R. R. Tolkien', number_of_chapters: 60)
      char1 = tlotr.characters.create!(name: 'Gollum', age: 15, antagonist: true)
      char2 = tlotr.characters.create!(name: 'Legolas', age: 200, antagonist: true)
      char3 = tlotr.characters.create!(name: 'Good Guy', age: 500, antagonist: false)

      visit '/characters'

      expect(page).to have_content(char1.name)
      expect(page).to have_content(char2.name)
      expect(page).to_not have_content(char3.name)
    end

    describe "I visit the novel's characters page" do
      it 'shows all the characters for that novel' do
        eleven_minutes = Novel.create!(title: 'Eleven Minutes', author: 'Paulo Coelho', number_of_chapters: 10)
        hyos = Novel.create!(title: '100 Years of Solitude', author: 'Gabriel García Márquez', number_of_chapters: 30)

        char1 = eleven_minutes.characters.create!(name: 'Ralf Hart', age: 38)
        char2 = eleven_minutes.characters.create!(name: 'Nyah', age: 27)
        char3 = hyos.characters.create!(name: 'Amaranta', age: 20)
        char4 = hyos.characters.create!(name: 'Úrsula Iguarán', age: 45)

        visit "/novels/#{hyos.id}/characters"

        expect(page).to have_content(char3.name)
        expect(page).to have_content(char3.age)
        expect(page).to have_content(hyos.id)
        expect(page).to have_content(char4.name)
        expect(page).to have_content(char4.age)
        expect(page).to_not have_content(char1.name)
        expect(page).to_not have_content(char2.age)
      end

      it "returns records over a given treshold by inputing into a form" do
        hyos = Novel.create!(title: '100 Years of Solitude', author: 'Gabriel García Márquez', number_of_chapters: 30)
        char_1 = hyos.characters.create!(name: 'Amaranta', age: 20)
        char_2 = hyos.characters.create!(name: 'Úrsula Iguarán', age: 45)
        char_3 = hyos.characters.create!(name: 'Francisco Patotas', age: 26)

        visit "/novels/#{hyos.id}/characters"

        fill_in "age_limit[number]", with: 22
        click_button "Only return characters with more than amount of age available"

        expect(page).to have_content(char_2.name)
        expect(page).to have_content(char_3.name)
        expect(page).to_not have_content(char_1.name)
      end

      it "has a link that sorts records alphabetically" do
        hyos = Novel.create!(title: '100 Years of Solitude', author: 'Gabriel García Márquez', number_of_chapters: 30)
        char_1 = hyos.characters.create!(name: 'Amaranta', age: 20)
        char_2 = hyos.characters.create!(name: 'Ursula Iguarán', age: 45)
        char_3 = hyos.characters.create!(name: 'Francisco Patotas', age: 26)
        char_4 = hyos.characters.create!(name: 'Gerardo Flores', age: 31)

        visit "/novels/#{hyos.id}/characters"
        expect(page).to have_link("Sort A-Z")
        expect(char_2.name).to appear_before(char_4.name)
        click_link("Sort A-Z")

        expect(char_1.name).to appear_before(char_4.name)
        expect(char_3.name).to appear_before(char_2.name)
      end
    end
  end
end
