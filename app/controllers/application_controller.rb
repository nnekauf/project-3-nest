class ApplicationController < ActionController::Base

    helper_method(:current_user)

    def current_user
        @current_user = Reader.find_by(id: session[:reader_id])
    end
end
