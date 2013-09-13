window.SignsView = Backbone.View.extend({

  intialize: (options) ->
    @signViews = []
    @collection = options.collection



  bindEvents: () ->    
    @listenTo(@collection, 'add', @addOne, @ )

  addOne: (model) ->
    console.log 'added one'
    signView = new window.SignView(model: model)
    @signViews.push(signView)
    @$el.append(signView.el)
    signView.render()

  render: () ->    
    if @collection.length > 0 
      _.forEach(@signViews, (signView) ->
        signView.remove()
      )
      @signViews = []      
      @$el.empty()
      @collection.forEach( @addOne, @)
    else
      @$el.empty()
      @$el.append("<div class='offset4 span6'> <p> Aún no hay ninguna firma, ¿te animas a ser el primero? </p> </div>")

})