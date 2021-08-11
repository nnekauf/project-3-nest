class Review < ApplicationRecord
    belongs_to :book
    belongs_to :reader

    validates_presence_of :text
end

