class VotesController < ApplicationController
  before_action :gate_keeper, only: [:create]
  def create
    votable_type = (params[:vote][:votable_type]).constantize
    type_instance = votable_type.find(params[:vote][:votable_id])
    vote_if_havent_voted(type_instance)
    redirect_to page_voted_from_path
  end

  def vote_params
    params.require(:vote).permit(:voter_id, :votable_type, :votable_id, :value)
  end
end