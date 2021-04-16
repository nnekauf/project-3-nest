class ReadersController < ApplicationController
    # before_action(:require_login, except: [:new, :create])

    def welcome
       
    end
    
    def home
       
    end

    def index
        @readers = Reader.all
    end

    def new
        @reader = Reader.new
    end

    def show
        @reader = Reader.find_by(id: params[:id])
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
