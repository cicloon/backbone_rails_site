class TrackSearchesController < ApplicationController

  before_filter :require_login

  def create
    @track_search = TrackSearch.new query: params[:track_search]
    @spotifiery_tracks = @track_search.results    
    respond_to do |format|
      format.json { render json: @spotifiery_tracks.map{ |track| track.to_voted_track_attributes current_user} }
    end
  end

end