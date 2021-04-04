module GoalsHelper

    def show_authors_bio(g, index)
        if index
            g.authors.each do |b|
                b.bio
            end 
        end
    end
  
  
    def form_url_helper(author)
      author ? author_goals_path(author) : goals_path
    end
  
  end
  