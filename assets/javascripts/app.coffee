require ['common'], () ->
  require [
      'backbone.marionette', 
      'jquery',
      'semantic',
      'j/app/views/items/Todo',
      'j/app/models/Todo'
    ], (Marionette, $, semantic, TodoView, TodoModel) ->

      app = new Marionette.Application()

      # Initialize the dimmer hiding
      app.on 'initialize:after', (options) ->
        $('#load').hide()

      # Start the app
      app.start()

      app.addRegions({
        'MainRegion': '#main'
      })
###
      app.MainRegion.show(
        new TodoView({
          'model': new TodoModel({
            'title': 'Love Mimosa',
            'done': true
          })
        })
      )

      console.log app.MainRegion###