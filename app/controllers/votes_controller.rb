class VotesController < ApplicationController
  def create
    answer = Answer.find(params[:vote][:votable_id])
    vote = answer.votes.build(vote_params)
    vote.voter_id = current_user.id
    if vote.save
      flash[:notice] = "You voted!"
      redirect_to question_path(answer.question)
    else
      redirect_to question_path(question)
    end
  end

  def vote_params
    params.require(:vote).permit(:voter_id, :votable_type, :votable_id, :value)
  end
end