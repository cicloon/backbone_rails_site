window.SignView = Backbone.View.extend({

  initialize: (options) ->

  className: 'sign-box span3',

  template: JST['signs/sign_box'],

  formattedAttributes: () ->
    invitee_names = @model.get('invitee_names')
    formatted_invitee_names = ""

    if invitee_names.length > 1
      formatted_invitee_names = _.reduce(invitee_names, (memo, name, index) ->
        if (index+1) == invitee_names.length
          return "#{memo} y #{name}"
        else
          return if memo.length > 0 then "#{memo}, #{name}" else name
            

      , "" )
    else
      formatted_invitee_names = invitee_names


    return {body: @model.get('body'), formatted_invitee_names: formatted_invitee_names}


  render: () ->
    @$el.hide()
    @$el.html @template( @formattedAttributes() )
    @$el.fadeIn(1200)
    @$('blockquote').vAlign()
  
})