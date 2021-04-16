class ReadersController < ApplicationController
    def welcome
       
    end

    def new
        @reader = Reader.find_by(id: params[:id])
    end

    def create

    end
end
