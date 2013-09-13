window.MostVotedTracksView = Backbone.View.extend({
  initialize: (options) ->
    @collection = options.collection
    @votedTrackViews = []
    $(@parent).append(@el)
    @listenTo(@collection, 'reset', @render)

  addOne: (model) ->    
    votedTrackView = new VotedTrackView(model: model)
    votedTrackView.render()
    @votedTrackViews.push( votedTrackView )
    @$el.append(votedTrackView.el)

  parent: '#most-voted-tracks-wrapper',

  tagName: 'ol',
  id: 'most-voted-tracks'

  render: ->
    _.forEach(@votedTrackViews, (votedTrackView) ->
      votedTrackView.remove()
    )
    @$el.empty()
    @collection.forEach( @addOne, @)

})