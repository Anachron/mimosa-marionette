require ['common'], () ->
  require [
      'backbone.marionette', 
      'jquery', 
      'hbs!../templates/app/test'
    ], (Marionette, $, tpl) ->
    app = new Backbone.Marionette.Application()
    # Initialize the dimmer hiding
    app.on 'initialize:after', (options) ->
      $('.main.dimmer').hide()
    # Start the app
    app.start()
    console.log tpl