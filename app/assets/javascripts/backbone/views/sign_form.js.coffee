window.SignForm = Backbone.View.extend({
  template: JST['signs/form'],

  errorsTemplate: JST['shared/errors'],

  events:
    'submit #new-sign-form' : 'save'
    'keyup #sign-body' : 'updateCharactersRemain'


  initialize: (options) ->
    @collection = options.collection
    @invitees = options.invitees

  render: () ->
    @$el.html( @template(invitees: @invitees.toJSON() ) )


  save: (e) ->
    e.preventDefault()
    @collection.create( @formAttributes(), {
      wait: true, 
      success: _.bind(@clear, @), 
      error: _.bind(@showErrors, @) } )    


  updateCharactersRemain: (e) ->
    
    num_characters = @$('#sign-body').val().length 
    remaining = 140 - num_characters
    if remaining < 0
      remaining = 0
      @$('#sign-body').val( @$('#sign-body').val().slice(0, 140) )

    @$('#remaining-chars').html( remaining )

  formAttributes: () ->
    return {
      body: $('#sign-body').val(),  
      invitee_ids: _.map(@$('.invitee-id:checked'), (item) ->
        return $(item).val()
      )
    }

  showErrors: (model, response) ->
    @$('#errors').empty()
    errors = $.parseJSON(response.responseText)
    @$('#errors').append( @errorsTemplate( errors ) )

  clear: () ->
    @$('#errors').empty()
    @$('.invitee-id:checked').prop('checked', false)
    @$('#sign-body').val('')
    @$('#remaining-chars').html( 140 )    


})