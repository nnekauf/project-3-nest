module BooksHelper
    def show_authors_bio(g, index)
        if index
            g.authors.each do |b|
                b.bio
            end 
        end
    end
  
  
    def form_url_helper(reader)
      reader ? reader_books_path(reader) : books_path
    end
  
end
