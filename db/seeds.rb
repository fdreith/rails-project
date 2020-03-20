# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

yoko = Author.create(name: "Yoko Ono")
jd = Author.create(name: "J.D. Salinger")
orwell  = Author.create(name: "George Orwell")
margo = Author.create(name: "Margaret Salinger")
sylvia = Author.create(name: "Sylvia Plath")
gerald = Author.create(name: "Gerald M Edelman")
joy = Author.create(name: "Joy M. Zarembka")
gibran = Author.create(name: "Kahlil Gibran")
toni = Author.create(name: "Toni Morrison")
robert = Author.create(name: "Robert M. Pirsig")
haruki = Author.create(name: "Haruki Murakami")

poetry = Genre.create(name: "Poetry")
dystopian = Genre.create(name: "Dystopian Fiction")
fiction = Genre.create(name: "Fiction")
biography = Genre.create(name: "Biography")
nonfiction = Genre.create(name: "Nonfiction")

yoko.books.create(title: "grapefruit", genre_id: poetry.id, page_count: "unnumbered")

jd.books.create(title: "Nine Stories", genre_id: fiction.id, page_count: "198")
jd.books.create(title: "Catcher in the Rye", genre_id: fiction.id, page_count: "214")
jd.books.create(title: "Franny and Zooey", genre_id: fiction.id, page_count: "202")
jd.books.create(title: "Raise High the Roofbeam Carpenters", genre_id: fiction.id, page_count: "248")

orwell.books.create(title: "1984", genre_id: dystopian.id, page_count: "326")
orwell.books.create(title: "Animal Farm", genre_id: dystopian.id, page_count: "112")

margo.books.create(title: "Dream Catcher", genre_id: biography.id, page_count: "450")

sylvia.books.create(title: "The Bell Jar", genre_id: fiction.id, page_count: "264")
sylvia.books.create(title: "Ariel", genre_id: poetry.id, page_count: "128")

gerald.books.create(title: "Second Nature", genre_id: fiction.id, page_count: "157")

joy.books.create(title: "The Pigment of Your Imagination", genre_id: nonfiction.id, page_count: "312")

gibran.books.create(title: "The Prophet", genre_id: poetry.id, page_count: "96")

toni.books.create(title: "Song of Solomon", genre_id: fiction.id, page_count: "341")

robert.books.create(title: "Zen and the Art of Motorcycle Maintenance", genre_id: fiction.id, page_count: "540")

haruki.books.create(title: "The Wind-Up Bird Chronicle", genre_id: fiction.id, page_count: "607")
haruki.books.create(title: "Killing Commendatore", genre_id: fiction.id, page_count: "512")

