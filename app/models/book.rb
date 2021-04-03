class Book < ApplicationRecord
    has_many :plots #a book has different events that happen creating multiple plots whether it is the main plot or not.
    has_many :goals, through: :plots #it is through the plot of the book that many goals can be achieved
    has_many :readers, through: :goals #through the goals of the book, it can have many users who have goals that are in line with the book

    validates_presence_of :title 
    validates_presence_of :author 
    validate :is_title_case
    before_validation :make_title_case


    def goals_attributes=(attrs)
        attrs.values.each do |hash|
          if hash[:id]
            g = Goal.find_by(id: hash[:id])
            g.update(hash)
          else
            self.goals.build(hash)
          end
        end
    end
end
