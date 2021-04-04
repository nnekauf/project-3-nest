# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Reader.create([{ username: 'DeniseReads', email: 'denisereadsexample@gmail.com', password: 'password' }, {username: 'sallyreads', email: 'sallyreadsexample@gmail.com', password: 'password'  }, { username: 'CharlieReads', email: 'charliereadsexample@gmail.com', password: 'password'  }])

Author.create([{bio: "My passion is creating amazing gardening books to cultivate an inspiring nation!", full_name: "Misses Greenthumb"}, { bio: "My finances have changed ever since I leanred to value of owning my own!", full_name: "Mr. Money"}, {bio: "Love rules all in my opinion. When I stooped and realized that I had to spread love, I was enlightened.", full_name: "Dr. Love"}])



Book.create([{title: "Gardening 101", storyline: "Get your geens, beans, potatoes, and tomatoes here!", reader_id: 1, author_id: 1}, {title: "Self-Made 101", storyline: "Get to the money, that bag.", reader_id: 2, author_id: 2}, {title: "Romance 101", storyline: "Love is so amazing", reader_id: 3, author_id: 3}])