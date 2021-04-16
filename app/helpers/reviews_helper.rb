module ReviewsHelper

    def check_owner(obj)
        obj.reader == current_user
      end
  
      def redirect_if_not_owner(obj)
        if !check_owner(obj)
          flash[:message] = "Sorry, this is not your review!"
          redirect "/home"
        end
      end
end
