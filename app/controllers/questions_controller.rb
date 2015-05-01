class QuestionsController < ApplicationController

	before_action :bounce_guest, only: [:new]

  def index
    @questions = Question.all
  end

	def new
		@question = Question.new
	end

	def create
		question = current_user.questions.build(question_params)
    if question.save
      flash[:notice] = "Your question has been posted!"
      redirect_to question_path(question)
    else
      flash[:notice] = "Sorry, your question didn't save. Please try again."
      redirect_to new_question_path
    end
	end

	private

	def question_params
		params.require(:question).permit(:title, :body, :user_id)
	end

	def bounce_guest
		if !current_user
			flash[:notice] = "Please sign in to view that page."
			redirect_to signin_path
		end
	end
end