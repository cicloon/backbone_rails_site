class VotedTrack < ActiveRecord::Base
  
  has_many :user_voted_tracks, inverse_of: :voted_track
  has_many :users, through: :user_voted_tracks

  validate :track_uri, unique: true

  attr_accessible :track_name, :track_uri, :album_name, :album_uri, :artist_name, :artist_uri


  def self.up_vote(user, track_attributes)
    voted_track =  VotedTrack.find_by_track_uri track_attributes[:track_uri]
    voted_track = VotedTrack.create(track_attributes) if voted_track.blank?
    user.voted_tracks << voted_track unless user.has_voted_track? voted_track
  end


  def self.down_vote(user, voted_track)
    user_voted_track = user.user_voted_tracks.find_by_voted_track_id voted_track.id
    user_voted_track.destroy if user_voted_track.present?
  end

  def self.most_voted
    VotedTrack.order("user_voted_tracks_count desc").limit(5)
  end



  def num_votes
    users.size
  end

end
