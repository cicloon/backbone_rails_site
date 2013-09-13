window.MostVotedTracks = Backbone.Collection.extend({
  url: '/most_voted_tracks',
  model: VotedTrack
})