class BooksController < ApplicationController


    def index
      
        if params[:title]  #if we search by title
          @books = Book.title_search(params[:title].to_s)
        elsif params[:reader_id] #if we are nested reader/:id/books
          @reader = Reader.find_by(id: params[:reader_id])
          @books = @reader.books
        #   @books.each do |b|
        #     @review = Review.find_by(id: book.id).text 
        #   end
        # elsif params[:author_id] #if we are nested review/id/books
        #   author = Author.find_by(id: params[:author_id])
        #   @books = author.books
        else 
          @books = Book.all
        end
      
    end

    def show
        @book = Book.find_by(id: params[:id])
        
        # binding.pry
    end

end
