window.SearchTrack = Backbone.Paginator.clientPager.extend({
  initialize: (options) ->
    @search_query = options['search_query']
  model: SpotifieryTrack,
  paginator_core: {
    type: 'POST', 
    dataType: 'json',
    url: '/track_searches'
  },
  paginator_ui: {
    firstPage: 1,
    currentPage: 1,
    perPage: 5,
    totalPages: 20,
    pagesInRange: 4
  },
  server_api: {
    'format': 'json',
    'callback': 'callback',
    'track_search' : ->
      return @search_query
  },
  parse: (response) ->      
    @tracks = response
})