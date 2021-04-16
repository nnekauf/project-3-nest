# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Reader.create([{ username: 'DeniseReads', email: 'denisereadsexample@gmail.com', password: 'password' }, {username: 'sallyreads', email: 'sallyreadsexample@gmail.com', password: 'password'  }, { username: 'CharlieReads', email: 'charliereadsexample@gmail.com', password: 'password'  }])




Book.create([{title: "Gardening 101", author: "Misses Greenthumb"}, {title: "Self-Made 101", author: "Mr. Money"}, {title: "Romance 101", author: "Dr. Love"}])

Review.create([{text: "This book delivers amazing gardening tips to cultivate and inspire clean eating!", book_id: 1, reader_id: 1}, { text: "My finances have changed ever since I leanred to value of owning my own!", book_id: 2, reader_id: 2}, {text: "Love rules all in my opinion. When I stooped and realized that I had to spread love, I was enlightened.", book_id: 3, reader_id: 3}])
