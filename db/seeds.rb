# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# User.destroy_all  
# Card.destroy_all
# Message.destroy_all

#Add a card
if Card.count == 0
  # exmachina tt0470752; devs tt8134186, halt and catch fire tt2543312, the matrix tt0133093
  Card.create(imdb_id: "tt0470752")
  Card.create(imdb_id: "tt8134186")
  # Card.create(imdb_id: "tt2543312")
  # Card.create(imdb_id: "tt0133093")
end

#Add a user
if User.count == 0
  User.create(username: "Gizelle", email: "gizelle205@hotmail.com", password: "Password123456", password_confirmation: "Password123456")
  User.create(username: "testuser", email: "test@email.com", password: "Password123456", password_confirmation: "Password123456")
end

#Add messages 
if Message.count == 0
   Message.create(m_text: "Dev themes are so entertaining", user_id: 1, card_id: 1)
   Message.create(m_text: "Best movie ever!", user_id: 1, card_id: 1)
   Message.create(m_text: "Im a test bot ..beep beep", user_id: 1, card_id: 2)
   Message.create(m_text: "Nulla rhoncus volutpat massa.", user_id: 1, card_id: 2)

   Message.create(m_text: "Donec nulla ipsum, facilisis id nunc non, auctor mollis sapien. Nullam sit amet neque bibendum, varius urna ut, placerat magna. Nullam sed hendrerit metus, sit amet pellentesque arcu. In et cursus risus. Quisque nisi dui, maximus quis purus finibus, rhoncus tempus erat.", user_id: 2, card_id: 1)
   Message.create(m_text: "Mauris fermentum mollis enim id fringilla. Suspendisse elementum, nisl feugiat ultricies gravida, elit urna egestas nisi, ut auctor nunc mi nec magna.", user_id: 2, card_id: 1)
   Message.create(m_text: "Sed id ornare sapien.", user_id: 2, card_id: 2)
   Message.create(m_text: "Praesent eu risus porttitor, ultricies augue et, gravida velit. Pellentesque non elementum urna, sit amet sagittis eros.", user_id: 2, card_id: 2)
end

#Messages
# message1 = Message.create(username: 'BigMovieBuff', text: 'I think Marvel movies are the anime of the west, change my mind', date: '10/07/2021', spoiler: false)
# message2 = Message.create(username: 'xXxAnime-fanxXx', text: 'What? They are literally nothing alike! How could you say something like that??', date: '10/07/2021', spoiler: false)
# message3 = Message.create(username: 'CinemaAndChill420', text: 'No dude, Buff totally has a point', date: '11/07/2021', spoiler: true)
# message4 = Message.create(username: 'BigMovieBuff', text: '^^ This one gets it', date: '11/07/2021', spoiler: false)
# message5 = Message.create(username: 'ICantHelpMyself', text: 'Tony Stark dies in the end, GG', date: '12/07/2021', spoiler: true)