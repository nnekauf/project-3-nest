class BooksController < ApplicationController
    def index 
        if params[:reader_id]
            reader = Reader.find_by(id: params[:reader_id])
            @books = reader.books
          end
    end

    def show

    end

    def new

    end

    def create

    end

    def destroy

    end

    private

        def book_params

        end

        def set_book

        end
end
