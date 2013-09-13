class MostVotedTracksController < ApplicationController

  respond_to :json

  before_filter :require_login

  def index
    @voted_tracks = VotedTrack.most_voted.decorate
    render json: @voted_tracks.as_json(voted_for_user: current_user, collection: @voted_tracks)
  end


end