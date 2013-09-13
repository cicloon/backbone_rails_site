window.VotedTracksView = Backbone.View.extend({

  parent: '#voted-tracks-wrapper',
  tagName: 'ol',
  id: 'voted-tracks'  

  initialize: (options) ->
    @collection = options.collection
    @listenTo(@collection, 'reset', @render)
    @votedTrackViews = []
    $(@parent).append(@el)

  addOne: (model) ->    
    votedTrackView = new VotedTrackView(model: model)
    votedTrackView.render()
    @votedTrackViews.push( votedTrackView )
    @$el.append(votedTrackView.el)

  render: ->
    _.forEach(@votedTrackViews, (votedTrackView) ->
      votedTrackView.remove()
    )
    @votedTrackViews = []
    @$el.empty()
    @collection.forEach( this.addOne, this)

})