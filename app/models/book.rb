class Book < ApplicationRecord
    belongs_to :reader 
    belongs_to :author  

    validates_presence_of :title 
    validates_presence_of :author 

    validate :is_title_case
    before_validation :make_title_case

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

    def is_title_case
        if self.title != self.title.titlecase
            self.errors.add(:title, "must be tilecase")
        end
        if self.author != self.author.titlecase
            self.errors.add(:author, "must be tilecase")
        end
      end
    
      def make_title_case
        self.title = self.title.titlecase
        self.author = self.author.titlecase
      end

end
