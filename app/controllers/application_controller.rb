class ApplicationController < ActionController::Base

    helper_method(:current_user, :logged_in?, :redirect_if_not_reader)

    def current_user
        @current_user = Reader.find_by(id: session[:reader_id])
    end

    def logged_in?
        current_user != nil
    end

    def require_login
        ((flash[:message] = "You must be logged in to do that") && (redirect_to '/login')) if !logged_in?
    end
    
    
    def check_reader(reader)
        reader.id == current_user.id
    end
  
    def redirect_if_not_reader(reader)
        if !check_reader(reader)
            if params.to_s.include?("reviews")
          flash[:message] = "Sorry, this is not your review!"
            elsif params..to_s.include?("reviews")
                flash[:message] = "Sorry, these are not your books!"
            end
          redirect_to "/home"
        end
    end

end
