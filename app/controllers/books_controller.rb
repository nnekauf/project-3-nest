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
        @book = Book.new(book_params)
        @book.goals.each {|m| m.reader = current_user}
        
        if @book.save
            flash[:message] = "Successfully created!"
            redirect_to book_path(@book)
        else
          @goals = @book.goals.select{|m| m.user_id == current_user.id}
          render :new
        end

    end

    def destroy

    end

    private

        def book_params

        end

        def set_book

        end
end
