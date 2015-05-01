class AnswersController < ApplicationController
  def create
  end

  private

  def answer_params
    params.require(:answer).permit(:body, :question_id, :user_id)
  end

end