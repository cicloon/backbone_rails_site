# // This is a manifest file that'll be compiled into application.js, which will include all the files
# // listed below.
# //
# // Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# // or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
# //
# // It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# // the compiled file.
# //
# // WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
# // GO AFTER THE REQUIRES BELOW.
# //
# // Require all bootstrap js at the moment
# //
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require hamlcoffee
//= require underscore
//= require backbone
//= require backbone.paginator
//= require paloma
//= require spin.min
//= require jquery.spin
//= require jquery.valign.min
//= require_tree ./templates
//= require_tree ./backbone/models
//= require_tree ./backbone/collections
//= require_tree ./backbone/views

@toggleInviteeText = (text_html, invitee_id, disable_action) ->
  container = $('#' + invitee_id + ' .invitee-text')
  invitee_text = $( container, 'p')

  if container.is(':empty')
    console.log text_html
    console.log $(invitee_id + ' .invitee-text')

    container.html(text_html)
    container.slideDown()
  else
    $("##{invitee_id} .actions").attr('disabled',"false")
    $("##{invitee_id} ##{disable_action}").attr('disabled',"true")
    invitee_text.slideUp('normal', ->
      container.html(text_html)
      invitee_text.toggle('slide', 'swing', 400,  ->  
        
      )
    )


jQuery ->

  $(document).on('focus', '.input-prepend input', -> 
    $(@).parent().addClass('clear-shadow')
  )

  $(document).on('blur', '.input-prepend input', -> 
    $(@).parent().removeClass('clear-shadow')
  )  
  

    