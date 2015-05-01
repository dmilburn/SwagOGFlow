class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    User.find_by(id: session[:user_id])
  end

  def gate_keeper
    if !current_user
      flash[:notice] = "Please sign in to view that page."
      redirect_to signin_path
    end
  end

  def get_question_path(type)
    if type.class == Answer
      question_path(type.question)
    else
      question_path(type)
    end
  end
end
