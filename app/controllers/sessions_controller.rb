class SessionsController < ApplicationController
  def create
    # find the email in the users db
    user = User.find_by(email: params[:email])
    # if the username and password match
    if user && user.authenticate(params[:password])
      # create a session with the user
      session[:current_user_id] = user.id
      # redirect to root path for now, but this will need to redirect to server, manager, or chef
      redirect_to root_path
    else
      # redirect to a splash_path, which does not currently exist
      redirect_to splash_path
    end
  end

  # when the user logs out, remove the user from the session and redirect to the root path
  def destroy
    session[:current_user_id] = nil
    redirect_to root_path
  end
end
