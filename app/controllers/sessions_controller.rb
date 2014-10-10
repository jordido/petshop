class SessionsController < ApplicationController

  def new
  end

  def create
	  # Check if user with email exists
	  user = User.find_by_name(params[:name])
	  if user && user.authenticate(params[:password])
	    # Password is correct
	    # Set the session to current user
	    # Will use cookie
	    session[:user_id] = user.id

	    redirect_to root_url
	  else
	    # There's no user or the password is incorrect
	    render :new
	  end
  end

  def destroy
   session[:user_id] = nil
   redirect_to root_url
	end
end
