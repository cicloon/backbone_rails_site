window.VotedTrackView = Backbone.View.extend({
  initialize: (options) ->
    @listenTo(@model, 'votechange', @render)

  template: JST['spotifiery/voted_track'],

  tagName: 'li',

  className: 'voted-track',

  events:
    'click .downvote' : 'downvote'
    'click .vote' : 'vote'

  downvote: (e) ->
    e.preventDefault()
    @model.downvote()

  vote: (e) -> 
    e.preventDefault()
    @model.upvote()

  render: ->
    @$el.html @template( @model.toJSON() )


})