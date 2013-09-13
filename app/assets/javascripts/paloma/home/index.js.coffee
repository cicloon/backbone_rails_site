Paloma.callbacks['home/index'] = (params) ->

  class GoogleMapHandler
    constructor: ->
      @init_map()
      @init_input_variables()
      @bind_events()

    init_map: ->
      map_options = {}
      @church_coords = new google.maps.LatLng(37.17655, -3.58956)
      @ranch_coords = new google.maps.LatLng(37.176165, -3.593248)
      
      @honeymoon1_coords = new google.maps.LatLng(40.736, -74.012)
      @honeymoon2_coords = new google.maps.LatLng(28.553, -81.381)
      @honeymoon3_coords = new google.maps.LatLng(25.7974, -80.227)

      map_options.center = @church_coords
      map_options.zoom = 16
      map_options.mapTypeId = google.maps.MapTypeId.ROADMAP
      @map = new google.maps.Map(document.getElementById("map-container"),
              map_options)


    init_input_variables: ->
      @church_link = $('#church_link')
      @ranch_link = $('#ranch_link')
      @honeymoon_link1 = $('#honeymoon_link1')
      @honeymoon_link2 = $('#honeymoon_link2')
      @honeymoon_link3 = $('#honeymoon_link3')

    bind_events: ->
      @church_link.on('click', _.bind(@_map_to, @, @church_coords, 17 ) )
      @ranch_link.on('click', _.bind(@_map_to, @, @ranch_coords, 17 ) )
      @honeymoon_link1.on('click', _.bind(@_map_to, @, @honeymoon1_coords, 12 ) )
      @honeymoon_link2.on('click', _.bind(@_map_to, @, @honeymoon2_coords, 12 ) )
      @honeymoon_link3.on('click', _.bind(@_map_to, @, @honeymoon3_coords, 12 ) )

    _map_to: (coords, zoomLevel, e) ->
      e.preventDefault()
      @map.panTo(coords)
      @map.setZoom(zoomLevel)
  


  $ ->
    
    googleMapHandler = new GoogleMapHandler()
    
    queryView = new SearchTrackView()
    queryView.render()
    
    mostVotedTracks = new MostVotedTracks(params['most_voted_tracks'])
    mostVotedTracksView = new MostVotedTracksView(collection: mostVotedTracks)
    mostVotedTracksView.render()

    mostVotedTracks.listenTo(queryView, 'somevote', ->
      mostVotedTracks.fetch({reset: true})
    )

    $('.coming-soon').tooltip()    




