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

    it "has a link to create new novel" do
      visit "/novels"

      expect(page).to have_link("New Novel")

      click_link "New Novel"

      expect(current_path).to eq("/novels/new")
    end

    it "shows most recent created novel" do
      eleven_minutes = Novel.create!(title: 'Eleven Minutes', author: 'Paulo Coelho', number_of_chapters: 10)
      hyos = Novel.create!(title: '100 Years of Solitude', author: 'Gabriel García Márquez', number_of_chapters: 30)
      great_gatsby = Novel.create!(title: 'The Great Gatsby', author: 'F. Scott Ftizgerald', number_of_chapters: 15)
      
      visit "/novels"

      expect(Novel.first).to eq(eleven_minutes)
      expect(Novel.last).to eq(great_gatsby)

      expect(great_gatsby.title).to appear_before(eleven_minutes.title)
      expect(hyos.title).to appear_before(eleven_minutes.title)
    end
  end
end
