window.PaginationView = Backbone.View.extend({

  initialize: (options) ->
    @listenTo(@collection, 'reset', @render)                 
    @listenTo(@collection, 'change', @render)                 
    $(@parent).empty()
    $(@parent).append(@el)
    
  events: 
      'click a.servernext': 'nextResultPage'
      'click a.serverprevious': 'previousResultPage'
      'click a.serverlast': 'gotoLast'
      'click a.page': 'gotoPage'
      'click a.serverfirst': 'gotoFirst'
      'click a.serverpage': 'gotoPage'
      'click .serverhowmany a': 'changeCount'
  
  tagName: 'div',
  template: JST['pagination/basic_pager'],
  parent: '#pagination-wrapper'

  nextResultPage: (e) ->  
    e.preventDefault()    
    $('body, html').animate({scrollTop: $('body').position().top  }, 700)    
    @collection.requestNextPage(reset: true)
  
  previousResultPage: (e) ->  
    e.preventDefault()    
    $('body, html').animate({scrollTop: $('body').position().top  }, 700)        
    @collection.requestPreviousPage(reset: true)
  
  gotoFirst: (e) ->  
    e.preventDefault()    
    $('body, html').animate({scrollTop: $('body').position().top  }, 700)    
    @collection.goTo(@collection.information.firstPage, reset: true)
  
  gotoLast: (e) -> 
    e.preventDefault()    
    $('body, html').animate({scrollTop: $('body').position().top  }, 700)    
    @collection.goTo(@collection.information.lastPage, reset: true)
  
  gotoPage: (e) ->  
    e.preventDefault()    
    $('body, html').animate({scrollTop: $('body').position().top  }, 700)    
    page = $(e.target).text()
    @collection.goTo(page, reset: true)
  
  changeCount: (e) ->  
    e.preventDefault()    
    per = $(e.target).text()
    @collection.howManyPer(per)          

  render: () ->
    collectionInfo = @collection.info()    
    if collectionInfo.perPage < collectionInfo.totalRecords
      @$el.html @template(collectionInfo)
    else
      @$el.empty()
    

})