class ApplicationController < ActionController::Base

    helper_method(:current_user, :logged_in?)

    def current_user
        @current_user = Reader.find_by(id: session[:reader_id])
    end

    def logged_in?
        current_user != nil
    end

    def require_login
        ((flash[:message] = "You must be logged in to do that") && (redirect_to '/login')) if !current_user
    end
    
    def index_helper
        class_name = self.get_class_name
        instance_variable_set("@#{params["controller"]}", class_name.all)
    end

    def show_helper
        class_name = self.get_class_name
        instance_variable_set("@#{params["controller"].singularize}", class_name.find_by(id: params[:id]))
    end
    
    def get_class_name
        Object.const_get(params["controller"].titlecase.singularize)
    end

end
