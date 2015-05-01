class ResponsesController < ApplicationController

  def new
    @question = Question.find(params[:question_id])
    @response = @question.responses.build
  end

  def create
  end

  private

  def response_params
    params.require(:response).permit(:body)
  end

end