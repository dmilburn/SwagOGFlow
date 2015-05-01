class VotesController < ApplicationController
  def create
    question = Question.find(params[:question_id])
    vote = question.votes.build(params[:vote])
    vote.voter_id = current_user.id
    if vote.save
      redirect_to question_path(question)
    else
      redirect_to question_path(question)
    end
  end
end