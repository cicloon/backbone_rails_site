Paloma.callbacks['signs/index'] = (params) ->
  inviteesJSON = params.invitees
  signsJSON = params.signs
  $ ->

    signs = new window.Signs(signsJSON)


    invitees = new window.Invitees(inviteesJSON)

    signForm = new window.SignForm(collection: signs, invitees: invitees, el: $('#new-sign-form'))
    signForm.render()

    signsView = new window.SignsView(collection: signs, el: $('#signs'))
    signsView.render()
    signsView.bindEvents()    

