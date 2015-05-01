class VotesController < ApplicationController
  def create
    vote.voter_id = current_user.id
    if vote.save
    else
      redirect_to question_path(question)
    end
  end

  def vote_params
    params.require(:vote).permit(:voter_id, :votable_type, :votable_id, :value)
  end
end