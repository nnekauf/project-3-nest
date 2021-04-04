class BooksController < ApplicationController
    before_action(:require_login)
    # before_action(:show_helper, only: [:edit, :update])
    # before_action(:index_helper, only: :index)

    def index
      
      if params[:title]
        @books = Books.title_search(params[:title].to_s)
        # @books = Book.title_search(params[:title].to_s)
      else 
        @books = Book.all
      end
    
    end
    
      def show
        @book = Book.find_by(id: params[:id])
        # binding.pry
      end
    
      def new
        if params[:book_id]
          @book = Book.find_by(id: params[:book_id])
          @book = @book.Books.build
          @books = Book.all
        else
          @book = Book.new
          @books = Book.all
        end
    
      end
    
      def create
        @book = Book.create(Book_params)
        @book.reader = current_user
        if params[:book_id]
          @book.book_id = params[:book_id]
        end
        if @book.save
          flash[:message] = "Successfully created!"
          redirect_to books_path
        else
            @books = Book.all
           render :new
        end
        # if @book.save
        #     redirect_to book_path(@book)
        # else
        #   # redirect_to new_book_path
        #   @errors = @book.errors.full_messages
        #   render :new
        # end

        # Book = Book.create(Book_params)
        # redirect_to Book_path(Book)
      end
    
      def edit
        if @book.reader != current_user
          flash[:message] = "That is not your Book!"
          redirect_to '/Books'
        end
        # @book = Book.find_by(id: params[:id])
      end
    
      def update
        if @book.update(book_params)
          redirect_to books_path
        else
            
          render :edit
        end
      end
    
    
      def destroy
        book = Book.find_by(id: params[:id])
        book.delete
        redirect_to books_path
      end
    
    
      private
    
        def book_params
          params.require(:book).permit(:author, :title, :book_id, author_id, reader_id)
        end

        def set_book
          @book = Book.find_by(id: params[:id])
        end
end
