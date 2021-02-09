require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  describe 'I visit library id page' do
    it 'then shows only that library attributes' do

      little_creek = Library.create!(name: 'Little Creek', current_employees: 20, online_membership: true)


      visit "/libraries/#{little_creek.id}"

      expect(page).to have_content(little_creek.name)
      expect(page).to have_content(little_creek.current_employees)
      expect(page).to have_content(little_creek.online_membership)
    end

    it "then has link to delete library" do
      little_creek = Library.create!(name: 'Little Creek', current_employees: 20, online_membership: true)

      visit "/libraries/#{little_creek.id}"

      click_link 'Delete Library'

      expect(current_path).to eq("/libraries")
      expect(page).to_not have_content(little_creek.name)
    end
  end
end