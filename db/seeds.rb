# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all  
Card.destroy_all

#Add a card
exmachina = Card.create(imdb_id: "tt0470752")

#Add a user
gizelle = User.create(username: "Gizelle", email: "gizelle205@hotmail.com", password: "password123")

