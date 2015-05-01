class QuestionsController < ApplicationController
	def new
		@question = Question.new
	end

	def create
	end

	private

	def question_params
    params.require(:question).permit(:title, :body, :user_id)
  end

end