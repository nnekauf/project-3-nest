class Author < ApplicationRecord
   
    has_many :books 
    has_many :readers, through: :books 

    validates :bio, length: { minimum: 10 }
    validates_presence_of :full_name

    scope(:full_name_search, ->(full_name) { self.where("full_name like ?", "%#{full_name}%") })
  
    # def self.full_name_search(full_name)
    #     Goal.where("full_name like ?", "%#{full_name}%")
    #   end

end

