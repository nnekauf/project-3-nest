class ReviewsController < ApplicationController
    def index
        @reviews = Review.all
    end

    def show
        @review = Review.find_by(id: params[:id])
    end

    def new
        @review = Review.new
        @books = Book.all
    end

    def create

    end

    def edit

    end

    def update

    end

    def destroy

    end
end
