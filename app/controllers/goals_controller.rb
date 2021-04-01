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
        item = Goal.create(goal_params)
        redirect_to goal_path(goal)
      end
    
      def edit
        @goal = Goal.find_by(id: params[:id])
      end
    
      def update
        item = Goal.find_by(id: params[:id])
        item.update(goal_params)
        redirect_to(goal_path(goal))
      end
    
    
      def destroy
        item = Goal.find_by(id: params[:id])
        item.delete
        redirect_to goals_path
      end
    
    
      private
    
        def goal_params
          params.require(:goal).permit(:description, :completion_date)
        end
end
