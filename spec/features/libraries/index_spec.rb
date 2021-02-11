require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  describe 'I visit a libraries index page' do
    it 'shows name of each library' do
      library1 = Library.create!(name: 'Library 1', current_employees: 5, online_membership: true)
      little_creek = Library.create!(name: 'Little Creek', current_employees: 20, online_membership: true)
      hogwarts = Library.create!(name: 'Hogwarts', current_employees: 3, online_membership: true)

      visit "/libraries"

      expect(page).to have_content(library1.name)
      expect(page).to have_content(little_creek.name)
      expect(page).to have_content(hogwarts.name)
    end

    it "has a link to create new library" do
      visit "/libraries"

      expect(page).to have_link("New Library")

      click_link "New Library"

      expect(current_path).to eq("/libraries/new")
    end

    it "shows most recent created library" do
      library1 = Library.create!(name: 'Library 1', current_employees: 5, online_membership: true)
      little_creek = Library.create!(name: 'Little Creek', current_employees: 20, online_membership: true)
      hogwarts = Library.create!(name: 'Hogwarts', current_employees: 3, online_membership: true)

      visit "/libraries"

      expect(Library.first).to eq(library1)
      expect(Library.last).to eq(hogwarts)
      expect(hogwarts.name).to appear_before(library1.name)
      expect(little_creek.name).to appear_before(library1.name)
    end
  end
end
