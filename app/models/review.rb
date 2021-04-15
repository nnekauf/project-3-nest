class Review < ApplicationRecord
    belongs_to :books
    belongs_to :reader

    validates_presence_of :text
end
