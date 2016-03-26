class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate
    # redirect to users/new unless the session is with the current user
    redirect_to new_user_path unless session[:current_user_id]
  end

  def current_user
    # set the current user after logging in
    User.find(session[:current_user_id]) if session[:current_user_id]
  end


end
