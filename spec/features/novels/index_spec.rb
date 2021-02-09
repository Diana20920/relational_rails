require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  describe 'I visit a novels index page' do
    it 'shows name of each novel' do
      eleven_minutes = Novel.create!(title: 'Eleven Minutes', author: 'Paulo Coelho', number_of_chapters: 10)
      hyos = Novel.create!(title: '100 Years of Solitude', author: 'Gabriel García Márquez', number_of_chapters: 30)
      great_gatsby = Novel.create!(title: 'The Great Gatsby', author: 'F. Scott Ftizgerald', number_of_chapters: 15)

      visit "/novels"

      expect(page).to have_content(eleven_minutes.title)
      expect(page).to have_content(hyos.title)
      expect(page).to have_content(great_gatsby.title)
    end
  end
end