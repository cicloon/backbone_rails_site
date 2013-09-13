window.Sign = Backbone.Model.extend({

  url: '/signs',

  defaults: {
    body: '',
    invitee_ids: []
  }

})