class Goal < ApplicationRecord
    belongs_to :reader #a goal belongs to the person who sets it
    has_many :plots #a goal can be acieved through different scenarios/plots
    has_many :books, through: :plots #a goal is associated with different books through the plots that the book has
end
