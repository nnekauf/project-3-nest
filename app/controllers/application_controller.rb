class ApplicationController < ActionController::Base

    helper_method(:current_user)

    def current_user
        @current_user = Reader.find_by(id: session[:reader_id])
    end

    def require_login
        ((flash[:message] = "You must be logged in to do that") && (redirect_to '/login')) if !current_user
    end
    
    def index_helper
        class_name = self.get_class_name
        instance_variable_set("@#{params["controller"]}", class_name.all)
    end
end
