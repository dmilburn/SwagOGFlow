class VotesController < ApplicationController
  def create
    answer = Answer.find(params[:vote][:votable_id])
    vote = answer.votes.create(vote_params)
    vote.voter_id = current_user.id
    redirect_to question_path(answer.question)
  end

  def vote_params
    params.require(:vote).permit(:voter_id, :votable_type, :votable_id, :value)
  end
end