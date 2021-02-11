require 'rails_helper'

RSpec.describe Character do
  describe 'relationships' do
    it { should belong_to :novel }
  end

  describe "class methods" do
    describe "::all_true" do
      it "returns all records with antagonist column true" do
        hyos = Novel.create!(title: '100 Years of Solitude', author: 'Gabriel García Márquez', number_of_chapters: 30)
        hyos.characters.create!(name: 'Amaranta', age: 20, antagonist: true)
        hyos.characters.create!(name: 'Úrsula Iguarán', age: 45, antagonist: true)
        hyos.characters.create!(name: 'José Arcadio Buendía', age: 75, antagonist: true)
        hyos.characters.create!(name: 'Rebeca', age: 10, antagonist: false)

        expect(Character.all_true.count).to eq(3)
      end
      it "returns no records if antagonist column is false" do
        hyos = Novel.create!(title: '100 Years of Solitude', author: 'Gabriel García Márquez', number_of_chapters: 30)
        hyos.characters.create!(name: 'Amaranta', age: 20, antagonist: false)
        hyos.characters.create!(name: 'Úrsula Iguarán', age: 45, antagonist: false)
        hyos.characters.create!(name: 'José Arcadio Buendía', age: 75, antagonist: false)
        hyos.characters.create!(name: 'Rebeca', age: 10, antagonist: false)

        expect(Character.all_true.count).to eq(0)
      end
    end
  end
end