class VotedTracksController < ApplicationController
  layout 'floating'

  before_filter :require_login

  PER_PAGE = 10

  def index
    @voted_tracks = VotedTrack.order("user_voted_tracks_count desc").paginate(page: params[:page], per_page: PER_PAGE).decorate
    @pagination = set_pagination params[:page]

    js_callback params: {voted_tracks: @voted_tracks.as_json(voted_for_user: current_user, collection: @voted_tracks), pagination: @pagination}

    respond_to do |format|
      format.html{}
      format.json{ render json: {voted_tracks: @voted_tracks.as_json(voted_for_user: current_user, collection: @voted_tracks), pagination: @pagination}  }
    end

  end

  private

  def set_pagination page
    
    current_page = page || 1
    pagination = {
      totalRecords: @voted_tracks.total_entries, 
      perPage: PER_PAGE, 
      firstPage: 1, 
      currentPage: current_page.to_i, 
      totalPages: @voted_tracks.total_pages,      
      pageSet: @voted_tracks.total_pages.times.to_a.map{|i| i+=1} 
    }    
  end

end