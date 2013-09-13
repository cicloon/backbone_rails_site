class UserVotedTrack < ActiveRecord::Base
  belongs_to :user
  belongs_to :voted_track, counter_cache: true
  # attr_accessible :title, :body
end
