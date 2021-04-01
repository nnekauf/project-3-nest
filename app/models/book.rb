class Book < ApplicationRecord
    has_many :plots #a book has different events that happen creating multiple plots whether it is the main plot or not.
    has_many :goals, through: :plots #it is through the plot of the book that many goals can be achieved
    has_many :readers, through: :goals #through the goals of the book, it can have many users who have goals that are in line with the book
end
