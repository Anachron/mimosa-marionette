require ['common'], () ->
  require ['App', 'jquery'], (app, $) ->
    # Start the app
    app.start
    # and log it in the console
    console.log 'App started!'
    console.log app
    $('.main.dimmer').hide()