class BooksController < ApplicationController
    before_action(:require_login)
    before_action(:show_helper, only: [:edit, :update])
    before_action(:index_helper, only: :index)

    def index
      books = current_user.books
      if params[:completion_date]
        @books = Books.completion_date_search(params[:completion_date].to_s)
        # @books = Book.completion_date_search(params[:completion_date].to_s)
      else 
        @books = current_user.Books
      end
    
    end
    
      def show
        @Book = Book.find_by(id: params[:id])
        # binding.pry
      end
    
      def new
        if params[:book_id]
          @book = Book.find_by(id: params[:book_id])
          @Book = @book.Books.build
          @books = Book.all
        else
          @Book = Book.new
          @books = Book.all
        end
    
      end
    
      def create
        @Book = Book.create(Book_params)
        @Book.reader = current_user
        if params[:book_id]
          @Book.book_id = params[:book_id]
        end
        if @Book.save
          flash[:message] = "Successfully created!"
          redirect_to books_path
        else
            @books = Book.all
           render :new
        end
        # if @Book.save
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
        if @Book.reader != current_user
          flash[:message] = "That is not your Book!"
          redirect_to '/Books'
        end
        # @Book = Book.find_by(id: params[:id])
      end
    
      def update
        if @Book.update(Book_params)
          redirect_to Books_path
        else
            
          render :edit
        end
      end
    
    
      def destroy
        Book = Book.find_by(id: params[:id])
        Book.delete
        redirect_to Books_path
      end
    
    
      private
    
        def Book_params
          params.require(:Book).permit(:description, :completion_date, :book_id)
        end

        def set_Book
          @Book = Book.find_by(id: params[:id])
        end
end
