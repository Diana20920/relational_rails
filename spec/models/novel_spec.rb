require 'rails_helper'

RSpec.describe Novel do
  describe 'relationships' do
  it { should have_many :characters }
end
describe "instance methods" do
  describe "#characters_count" do
    it "returns a count of its characters" do
      hyos = Novel.create!(title: '100 Years of Solitude', author: 'Gabriel García Márquez', number_of_chapters: 30)
      hyos.characters.create!(name: 'Amaranta', age: 20)
      hyos.characters.create!(name: 'Úrsula Iguarán', age: 45)
      hyos.characters.create!(name: 'José Arcadio Buendía', age: 75)
      hyos.characters.create!(name: 'Rebeca', age: 10)

      expect(hyos.characters_count).to eq(4)
    end

    it "returns 0 if novel has no characters" do
      hyos = Novel.create!(title: '100 Years of Solitude', author: 'Gabriel García Márquez', number_of_chapters: 30)

      expect(hyos.characters_count).to eq(0)
    end
  end
  describe "#given_limit" do
    it "returns a subset of characters based on a given threshold for age" do
      hyos = Novel.create!(title: '100 Years of Solitude', author: 'Gabriel García Márquez', number_of_chapters: 30)
      hyos.characters.create!(name: 'Amaranta', age: 20)
      hyos.characters.create!(name: 'María', age: 31)
      hyos.characters.create!(name: 'Úrsula Iguarán', age: 45)
      hyos.characters.create!(name: 'José Arcadio Buendía', age: 75)

      expect(hyos.given_limit(40).count).to eq(2)
      expect(hyos.given_limit(10).count).to eq(4)
    end
    it "returns no characters if given threshold is more than age applicable" do
      hyos = Novel.create!(title: '100 Years of Solitude', author: 'Gabriel García Márquez', number_of_chapters: 30)
      hyos.characters.create!(name: 'Amaranta', age: 20)
      hyos.characters.create!(name: 'María', age: 31)
      hyos.characters.create!(name: 'Úrsula Iguarán', age: 45)

      expect(hyos.given_limit(45).count).to eq(0)
      expect(hyos.given_limit(60).count).to eq(0)
    end
  end
end
  describe "class methods" do
    describe "::sort_by_newest" do
      it "orders novels descending based on created_at attribute" do
        great_gatsby = Novel.create!(title: 'The Great Gatsby', author: 'F. Scott Ftizgerald', number_of_chapters: 15)
        moby_dick = Novel.create!(title: 'Moby Dick', author: 'Herman Melville', number_of_chapters: 7)
        animal_farm = Novel.create!(title: 'Animal Farm', author: 'George Orwell', number_of_chapters:12)
        tlotr = Novel.create!(title: 'The Lord of the Rings', author: 'J. R. R. Tolkien', number_of_chapters: 60)

        expect(Novel.sort_by_newest.first).to eq(tlotr)
        expect(Novel.sort_by_newest.last).to eq(great_gatsby)
      end
    end
  end
end