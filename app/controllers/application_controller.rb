class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

# Provide a global current_user() method to
# check if there's a user logged in from
# any controller or view
 def current_user
   if session[:user_id]
     # If current user is set in the session
     # return the current user
     @current_user ||= User.find(session[:user_id])
   end
 end

 def check_admin
 end
 # Indicate that the current_user() should be
 # a helper (accessible from views)
 helper_method :current_user

def user_is_admin
	current_user && current_user.admin
end

helper_method :current_user
helper_method :user_is_admin

end
