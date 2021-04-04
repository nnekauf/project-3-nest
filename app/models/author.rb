class Author < ApplicationRecord
   
    has_many :books 
    has_many :readers, through: :books 

    validates :bio, length: { minimum: 10 }
    validates_presence_of :full_name

    validate :is_title_case
    before_validation :make_title_case

    scope(:full_name_search, ->(full_name) { self.where("full_name like ?", "%#{full_name}%") })
  
    # def self.full_name_search(full_name)
    #     Goal.where("full_name like ?", "%#{full_name}%")
    #   end
    def is_title_case
        if self.full_name != self.full_name.titlecase
            self.errors.add(:title, "must be tilecase")
        end
      
      end
    
      def make_title_case
        self.full_name = self.full_name.titlecase
        
      end
end

