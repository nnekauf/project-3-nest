module GoalsHelper

    def show_book_title(g, index)
        g.book.title if index
    end
  
  
    def form_url_helper(book)
      book ? book_goals_path(book) : goals_path
    end
  
  end
  