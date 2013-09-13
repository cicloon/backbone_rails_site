Paloma.callbacks['voted_tracks/index'] = (params) -> 

  $ ->
    console.log params['voted_tracks']

    window.votedTracks = new VotedTracks(params['voted_tracks'])

    votedTracksView = new VotedTracksView(collection: votedTracks)

    votedTracks.bootstrap(params['pagination'])    
    votedTracksView.render()

    paginationView = new PaginationView(collection: votedTracks)
    paginationView.render()