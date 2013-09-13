window.SpotifieryTrack = Backbone.Model.extend({
  
  upvote: ->
    model = @
    console.log 'voting up'
    $.ajax({
      method: 'POST'
      url: '/users/track_votes',
      dataType: 'json',
      data: {track_attributes: model.toJSON() } ,
      success: (data, status, jqXHR) ->          
        votes = model.get('user_voted_tracks_count')
        votes += 1
        model.set('user_voted_tracks_count', votes)
        model.set('voted', true)
        model.trigger('votechange')
    })

  downvote: ->
    model = @
    $.ajax({
      url: "/users/track_votes/#{model.get('track_uri')}",
      dataType: 'json'
      data: {track_attributes: {} } ,
      method: 'DELETE',
      success: (data, status, jqXHR) ->
        votes = model.get('user_voted_tracks_count')
        votes -= 1
        model.set('user_voted_tracks_count', votes)        
        model.set('voted', false)
        model.trigger('votechange')
    })  
    
})