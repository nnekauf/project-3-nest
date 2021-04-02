class SessionsController < ApplicationController

    def new

    end

    def create
        @reader = Reader.find_by(email: params[:email])
        if @reader && @reader.authenticate(params[:password])
            session[:reader_id] = @reader.id
            redirect_to reader_books_path(@reader)
        elsif @reader
            @errors = ["Invalid Password"]
            render :new
          else
            @errors = ["Invalid Username"]
            render :new
          end
    end

    def destroy
        session.clear
        redirect_to '/signup'
    end
end