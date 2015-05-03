class VotesController < ApplicationController
  before_action :gate_keeper, only: [:create]
  def create
    votable_type = (params[:vote][:votable_type]).constantize
    type_instance = votable_type.find(params[:vote][:votable_id])
    if type_instance.votes.find_by(voter_id: current_user.id)
       redirect_to page_voted_from_path
    else
      vote = type_instance.votes.create(vote_params)
      redirect_to page_voted_from_path
    end
  end

  def vote_params
    params.require(:vote).permit(:voter_id, :votable_type, :votable_id, :value)
  end
end