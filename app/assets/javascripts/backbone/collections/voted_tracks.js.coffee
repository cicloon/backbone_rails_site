window.VotedTracks = Backbone.Paginator.requestPager.extend({
  
  model: VotedTrack,

  paginator_core: {
    url: '/voted_tracks',
    type: 'GET',
    dataType: 'json'  
  },

  paginator_ui: {
    firstPage: 1,
    currentPage: 1,
    perPage: 20,
    totalPages: 10
  },
  
  server_api: {
    page: () ->
      @currentPage      
  }

  parse: (data) ->
    @currentPage = data.pagination.currentPage
    @totalPages = data.pagination.totalPages
    @pageSet = data.pagination.pageSet
    @perPage = data.pagination.perPage
    @totalRecords = data.pagination.totalRecords
    console.log data.voted_tracks
    return data.voted_tracks

})

