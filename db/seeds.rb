# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Reader.create([{ username: 'DeniseReads', email: 'denisereadsexample@gmail.com', password: 'password' }, {username: 'sallyreads', email: 'sallyreadsexample@gmail.com', password: 'password'  }, { username: 'CharlieReads', email: 'charliereadsexample@gmail.com', password: 'password'  }])

Author.create([{bio: "I want to learn more about gardening", full_name: "Misses Greenthumb"}, { bio: "I want to learn start my own business", full_name: "person2"}, {bio: "I want to be more romantic towards my spouse", full_name: "person3"}])



Book.create([{title: "Gardening 101", author: "Misses Greenthumb", storyline: "amazings story bro", reader_id: 1, author_id: 1}, {title: "Self-Made 101", author: "Johhny Joe", storyline: "amazings story bro", reader_id: 2, author_id: 2}, {title: "Romance 101", author: "Dr. Love", storyline: "amazings story bro", reader_id: 3, author_id: 3}])