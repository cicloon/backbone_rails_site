window.SearchTrackView = Backbone.View.extend({

  initialize: ->
    @tracks = {}
    $(@parent).append(@el)
          
  parent: '.search-track',
  tagName: 'div',
  className: 'search-track-view',
  template: JST['spotifiery/search_query'],
  events:
    "click .perform-search" : 'search'


  search: (e) ->    
    @tracks.destroy
    e.preventDefault()>
    @tracks = new SearchTrack(search_query: @query() )
    @listenTo @tracks, 'add', @addOne
    @listenTo @tracks, 'reset', @addAll
    @listenTo(@tracks, 'change', -> 
          @trigger('somevote'))

    tracks = @tracks
    $('.search-results ul').slideUp(600, ->
      $('.search-results').empty()
      $('.search-results').spin()
      tracks.fetch({
        success: ->
          tracks.pager()
          $('.search-results ul').slideDown(600)
      })
    )
    

  addOne: (item) ->    
    trackView = new SpotifieryTrackView(model: item)
    trackView.render()
    $('.search-results ul').append( trackView.el )

  addAll: (e) ->
    $('.search-results').empty()
    $('.search-results').append('<ul></ul>')
    thisView = @
    if @tracks.length > 0
      @tracks.each (track) ->
        thisView.addOne(track)
    else
      $('.search-results').append("<p> Ups, no hemos encontrado ninguna canción, es posible que Spotify no esté respondiendo o que no exista ninguna canción con ese nombre.</p>")

  query: ->
    return $('#track_search_query').val()


  render: ->      
    $(@el).html @template( tracks: @tracks )
})