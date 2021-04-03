class ReadersController < ApplicationController

    before_action(:require_login, except: [:new, :create])

    def new
        @reader = Reader.new
    end

    def create
        @reader = Reader.new(reader_params)
        if @reader.save
            session[:reader_id] = @reader.id
            flash[:message] = "Successfully created account!"
            redirect_to reader_goals_path(@reader)
        else
            @errors = @reader.errors.full_messages
            render :new
        end
    end

    private

    def reader_params
      params.require(:reader).permit(:username, :email, :password, :password_confirmation)
    end
  
  
end
