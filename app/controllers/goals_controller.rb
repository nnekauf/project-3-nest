class GoalsController < ApplicationController
    def index
      if params[:completion_date]
        @goals = Goal.completion_date_search(params[:completion_date])
      end
        # @goals = Goal.all
      end
    
      def show
        @goal = Goal.find_by(id: params[:id])
      end
    
      def new
        if params[:book_id]
          @book = Book.find_by(id: params[:book_id])
          @goal = @book.goals.build
          @books = Book.all
        else
          @goal = Goal.new
          @books = Book.all
        end
    
      end
    
      def create
        @goal = Goal.create(goal_params)
        @goal.reader = current_user
        if params[:book_id]
          @goal.book_id = params[:book_id]
        end
        if @goal.save
          flash[:message] = "Successfully created!"
          redirect_to books_path
        else
            @books = Book.all
           render :new
        end
        # if @goal.save
        #     redirect_to book_path(@book)
        # else
        #   # redirect_to new_book_path
        #   @errors = @book.errors.full_messages
        #   render :new
        # end

        # goal = Goal.create(goal_params)
        # redirect_to goal_path(goal)
      end
    
      def edit
        if @goal.reader != current_user
          flash[:message] = "That is not your goal!"
          redirect_to '/goals'
        end
        # @goal = Goal.find_by(id: params[:id])
      end
    
      def update
        if @goal.update(goal_params)
          redirect_to goals_path
        else
            
          render :edit
        end
      end
    
    
      def destroy
        goal = Goal.find_by(id: params[:id])
        goal.delete
        redirect_to goals_path
      end
    
    
      private
    
        def goal_params
          params.require(:goal).permit(:description, :completion_date, :book_id)
        end
end
