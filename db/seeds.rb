# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Book.destroy_all
Library.destroy_all
Character.destroy_all
Novel.destroy_all

little_creek = Library.create!(name: 'Little Creek', current_employees: 20)
hogwarts = Library.create!(name: 'Hogwarts', current_employees: 3)
penli = Library.create!(name: 'PenLi', current_employees: 11)
vbpl = Library.create!(name: 'VBPL', current_employees: 23)
damneck = Library.create!(name: 'Damneck', current_employees: 8)
portales = Library.create!(name: 'Portales', current_employees: 5)

little_creek.books.create!(title: 'History of Little Creek', copies_available: 10)
little_creek.books.create!(title: 'Ruby', copies_available: 3)
little_creek.books.create!(title: 'Coding for Dummies', copies_available: 20)

hogwarts.books.create!(title: 'Magic for Muggles', copies_available: 2)
hogwarts.books.create!(title: 'Advanced Spells', copies_available: 6)
hogwarts.books.create!(title: 'Wands 101', copies_available: 2)
hogwarts.books.create!(title: 'Mandrakes!', copies_available: 8)

penli.books.create!(title: 'Dog Breeds And Their History', copies_available: 4)

vbpl.books.create!(title: 'Ruby', copies_available: 20)
vbpl.books.create!(title: 'History of Virginia Beach', copies_available: 20)

damneck.books.create!(title: 'Coding for Dummies', copies_available: 20)
damneck.books.create!(title: 'Garfield', copies_available: 5)
damneck.books.create!(title: 'Windows vs Mac', copies_available: 1)

portales.books.create!(title: 'Spanish 101', copies_available: 20)
portales.books.create!(title: 'French 201', copies_available: 20)



eleven_minutes = Novel.create!(title: 'Eleven Minutes', author: 'Paulo Coelho', number_of_chapters: 10)
hyos = Novel.create!(title: '100 Years of Solitude', author: 'Gabriel García Márquez', number_of_chapters: 30)
great_gatsby = Novel.create!(title: 'The Great Gatsby', author: 'F. Scott Ftizgerald', number_of_chapters: 15)
moby_dick = Novel.create!(title: 'Moby Dick', author: 'Herman Melville', number_of_chapters: 7)
animal_farm = Novel.create!(title: 'Animal Farm', author: 'George Orwell', number_of_chapters:12)
tlotr = Novel.create!(title: 'The Lord of the Rings', author: 'J. R. R. Tolkien', number_of_chapters: 60)

eleven_minutes.characters.create!(name: 'María', age: 20)
eleven_minutes.characters.create!(name: 'Ralf Hart', age: 38)
eleven_minutes.characters.create!(name: 'Nyah', age: 27)

hyos.characters.create!(name: 'Amaranta', age: 20)
hyos.characters.create!(name: 'Úrsula Iguarán', age: 45)
hyos.characters.create!(name: 'José Arcadio Buendía', age: 75)
hyos.characters.create!(name: 'Rebeca', age: 10)

great_gatsby.characters.create!(name: 'Tom Buchanan', age: 40)
great_gatsby.characters.create!(name: 'Daisy Buchanan', age: 25)
great_gatsby.characters.create!(name: 'Jay Gatsby', age: 28)

moby_dick.characters.create(name: 'Ishmael', age: 35)
moby_dick.characters.create(name: 'Captain Ahab', age: 45)
moby_dick.characters.create(name: 'Starbuck', age: 50)

animal_farm.characters.create!(name: 'Old Major', age: 10)
animal_farm.characters.create!(name: 'Mollie', age: 5)

tlotr.characters.create!(name: 'Gollum', age: 15)
tlotr.characters.create!(name: 'Legolas', age: 200)
tlotr.characters.create!(name: 'Bilbo Baggins', age: 40)
tlotr.characters.create!(name: 'Gandalf', age: 300)
