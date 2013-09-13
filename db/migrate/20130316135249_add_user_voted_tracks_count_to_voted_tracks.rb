class AddUserVotedTracksCountToVotedTracks < ActiveRecord::Migration
  def change
    add_column :voted_tracks, :user_voted_tracks_count, :integer
  end
end
