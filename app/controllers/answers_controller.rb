class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:id])
    @answer = @question.answers.build(params)
  end
end