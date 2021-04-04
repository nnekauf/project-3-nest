class Author < ApplicationRecord
   
    has_many :books #a goal can be acieved through different scenarios/plots
    has_many :readers, through: :books #a goal is associated with different books through the plots that the book has

    validates :bio, length: { minimum: 10 }
    validates_presence_of :full_name

    scope(:full_name_search, ->(full_name) { self.where("full_name like ?", "%#{full_name}%") })
  
    # def self.full_name_search(full_name)
    #     Goal.where("full_name like ?", "%#{full_name}%")
    #   end

end

