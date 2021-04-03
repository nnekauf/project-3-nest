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
        @book = Book.new
        @book.goals.build(reader: current_user)
        @book.goals.build(reader: current_user)
        @goals = @book.goals.select{|m| m.reader_id == current_user.id}
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
