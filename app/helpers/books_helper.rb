module BooksHelper
    def show_authors_bio(g, index)
        if index
            g.authors.each do |b|
                b.bio
            end 
        end
    end
  
  
    def form_url_helper(author)
      author ? author_books_path(author) : books_path
    end
  
end
