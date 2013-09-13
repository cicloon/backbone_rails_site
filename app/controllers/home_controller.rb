class HomeController < ApplicationController

  before_filter :require_login

	def index
    @most_voted_tracks = VotedTrack.most_voted.decorate
    @track_search = TrackSearch.new

    js_callback params: {most_voted_tracks: @most_voted_tracks.as_json(voted_for_user: current_user, collection: @most_voted_tracks)}

  end

end