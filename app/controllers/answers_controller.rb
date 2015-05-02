class AnswersController < ApplicationController
  def create
    question = Question.find(params[:question_id])
    answer = question.answers.build(answer_params)
    answer.user_id = current_user.id
    if answer.save
      redirect_to question_path(question)
    else
      redirect_to new_question_answer_path
    end
  end

  def select
    answer = Answer.find(params[:answer_id])
    question = answer.question
    question.update(answered: true)
    answer.update(selected: true)
    redirect_to question_path(question)
  end

  private

  def answer_params
    params.require(:answer).permit(:body, :question_id, :user_id)
  end

end