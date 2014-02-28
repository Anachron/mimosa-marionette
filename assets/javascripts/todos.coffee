require ['common'], () ->
  require ['App'], (app) ->
    # Start the app
    app.start
    # and log it in the console
    console.log 'App started!'
    console.log app