class Book < ApplicationRecord
    belongs_to :reader 
    belongs_to :author  

    validates_presence_of :title 
    validates_presence_of :author 

    
scope(:title_search, ->(title) { self.where("title like ?", "%#{title}%") })

    def books_attributes=(attrs)
        attrs.values.each do |hash|
          if hash[:id]
            g = Book.find_by(id: hash[:id])
            g.update(hash)
          else
            self.books.build(hash)
          end
        end
    end

    

end
