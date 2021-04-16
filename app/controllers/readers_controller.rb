class ReadersController < ApplicationController
    def welcome
       
    end

    def new
        @reader = Reader.new
    end

    def create
        @reader = Reader.new(reader_params)
        if @reader.save
            session[:reader_id] = @reader.id
            flash[:message] = "Successfully created account!"
            redirect_to "/home"
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
