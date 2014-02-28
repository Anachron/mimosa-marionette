require ['common'], () ->
  require ['backbone.marionette', 'jquery'], (Marionette, $) ->
    app = new Backbone.Marionette.Application()
    # Initialize the dimmer hiding
    app.on 'initialize:after', (options) ->
      $('.main.dimmer').hide()
    # Start the app
    app.start()