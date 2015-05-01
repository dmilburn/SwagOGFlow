class VotesController < ApplicationController
  def create
    votable_type = (params[:vote][:votable_type]).constantize
    type_instance = votable_type.find(params[:vote][:votable_id])
    vote = type_instance.votes.create(vote_params)
    vote.voter_id = current_user.id
    redirect_to type_instance.get_path
  end

  def vote_params
    params.require(:vote).permit(:voter_id, :votable_type, :votable_id, :value)
  end
end