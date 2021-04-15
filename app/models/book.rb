class Book < ApplicationRecord
    has_many :reviews
    has_many :readers, through: :reviews

    scope(:title_search, ->(title) { self.where("title like ?", "%#{title}%") })
end
