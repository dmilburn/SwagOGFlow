class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    User.find_by(id: session[:user_id])
  end

  def bounce_guest
    if !current_user
      flash[:notice] = "Please sign in to view that page."
      redirect_to signin_path
    end
  end


end
