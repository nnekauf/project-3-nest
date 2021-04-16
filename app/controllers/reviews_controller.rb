class ReviewsController < ApplicationController
    def index
      
        if params[:reader_id]
            reader = Reader.find_by(id: params[:reader_id])
            @reviews = reader.reviews
        else
            @reviews = Review.all
        end
    end

    def show
        @review = Review.find_by(id: params[:id])
      
    end

    def new
        @review = Review.new
        @books = Book.all
    end

    def create
        @review = Review.create(review_params)
        @review.reader = current_user

        if params[:book_id]
            @review.book_id = params[:book_id]
        end

        if @review.save
            flash[:message] = "Successfully created!"
            redirect_to books_path
        else
              @books = Book.all
             render :new
        end
     
    end

    def edit
        @review = Review.find_by(id: params[:id])
        # binding.pry
        if @review.reader != current_user
            flash[:message] = "That is not your review!"
            redirect_to '/reviews'
        end
    end

    def update
        
        @review = Review.find_by(id: params[:id])
        if @review.update(review_params)
            redirect_to review_path(@review.id)
        else
            render :edit
        end
    end

    def destroy

    end

    def review_params
        params.require(:review).permit(:text, :book_id, :reader_id, :id)
      end

    def set_review
    @review = Review.find_by(id: params[:id])
    end
end
