require ['common'], () ->
  require [
      'backbone.marionette', 
      'jquery',
      'handlebars',
      'hbs!../templates/app/test'
    ], (Marionette, $, hb, tpl) ->
    app = new Backbone.Marionette.Application()
    # Initialize the dimmer hiding
    app.on 'initialize:after', (options) ->
      $('.main.dimmer').hide()
    # Start the app
    app.start()
    console.log tpl({adjective: 'cool'})