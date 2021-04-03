class GoalsController < ApplicationController
    def index
        @goals = Goal.all
      end
    
      def show
        @goal = Goal.find_by(id: params[:id])
      end
    
      def new
        @goal = Goal.new
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
        @goal = Goal.find_by(id: params[:id])
      end
    
      def update
        goal = Goal.find_by(id: params[:id])
        goal.update(goal_params)
        redirect_to(goal_path(goal))
      end
    
    
      def destroy
        goal = Goal.find_by(id: params[:id])
        goal.delete
        redirect_to goals_path
      end
    
    
      private
    
        def goal_params
          params.require(:goal).permit(:description, :completion_date)
        end
end
