module ReviewsHelper

    def check_reader(obj)
        obj.id == current_user
      end
  
      def redirect_if_not_reader(obj)
        if !check_owner(obj)
          flash[:message] = "Sorry, this is not your review!"
          redirect "/home"
        end
      end
end
