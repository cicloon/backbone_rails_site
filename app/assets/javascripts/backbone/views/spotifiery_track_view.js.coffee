window.SpotifieryTrackView = Backbone.View.extend({
  tagName: 'li',
  className: 'spotifiery-track clearfix',
  template: JST['spotifiery/track'],

  events:
    "click .vote" : "vote"
    "click .unvote" : "downvote"

  initialize: ->
    @listenTo(@model, 'change:voted', @render)

  vote: (e) ->
    e.preventDefault()
    @model.upvote()


  downvote: (e) ->
    e.preventDefault()
    @model.downvote()


  modelDataToVote: ->
    data = {
      'track_name' : @model.get('track_name'),
      'track_uri' : @model.get('track_uri'),
      'album_name' : @model.get('album_name'),
      'album_uri' : @model.get('album_uri'),
      'artist_name' : @model.get('artist_name'),
      'artist_uri' : @model.get('artist_uri')
    }
    return data

  render: ->    
    $(@el).html @template( @model.toJSON() )
    

})