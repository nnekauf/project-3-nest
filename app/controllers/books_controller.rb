class BooksController < ApplicationController
    def index
      
        # if params[:title]
        #   @books = Book.title_search(params[:title].to_s)
        #   # @books = Book.title_search(params[:title].to_s)
        # elsif params[:reader_id]
        #   @reader = Reader.find_by(id: params[:reader_id])
        #   @books = @reader.books
        # elsif params[:author_id]
        #   author = Author.find_by(id: params[:author_id])
        #   @books = author.books
        # else 
          @books = Book.all
        # end
      
      end

end
