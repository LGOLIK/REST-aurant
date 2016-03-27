class SessionsController < ApplicationController
  def create
    # find the email in the users db
    user = User.find_by(email: params[:email])
    # if the username and password match
    if user && user.authenticate(params[:password]) && user.empl_type == "Manager"
      # create a session with the user
      session[:current_user_id] = user.id
      # redirect to the managers path
      redirect_to managers_path
    elsif user && user.authenticate(params[:password]) && user.empl_type == "Chef"
      # create a session with the user
      session[:current_user_id] = user.id
      # redirect to the chefs path
      redirect_to chefs_path
    elsif user && user.authenticate(params[:password]) && user.empl_type == "Server"
      # create a session with the user
      session[:current_user_id] = user.id
      # redirect to the servers path
      redirect_to servers_path
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
