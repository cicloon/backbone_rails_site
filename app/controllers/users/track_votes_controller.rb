class Users::TrackVotesController < ApplicationController

  before_filter :require_login

  def create
    valid_keys = ['track_uri', 'track_name', 'album_name', 'artist_name']

    params[:track_attributes].delete_if{|key, value| !valid_keys.include?(key.to_s) }
    VotedTrack.up_vote(current_user, params[:track_attributes])
    render json: { success: true }
  end

  def destroy
    voted_track = VotedTrack.find_by_track_uri(params[:id])
    VotedTrack.down_vote(current_user, voted_track)
    render json: { success: true }
  end

  private


end