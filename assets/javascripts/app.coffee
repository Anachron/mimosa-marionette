require ['common'], () ->
  require [
      'backbone.marionette', 
      'jquery',
      'semantic',
      'j/app/collections/Todo',
      'j/app/views/collections/Todo',
      'hbs!t/app/collections/Todo'
    ], (Marionette, $, semantic, TodoCollection, TodoCollectionView, TodoCollectionTemplate) ->

      app = new Marionette.Application()

      # Initialize the dimmer hiding
      app.on 'initialize:after', (options) ->
        $('#load').hide()

      # Start the app
      app.start()

      app.addRegions({
        'MainRegion': '#main'
      })

      ###app.MainRegion.show(
        new TodoView({
          'model': new TodoModel({
            'title': 'Love Mimosa',
            'done': true
          })
        })
      )###

      app.MainRegion.show(
        new TodoCollectionView({
          'collection': new TodoCollection([
            {
              id: 0,
              done: true,
              title: 'Install Mimosa'
            },{
              id: 1,
              done: true,
              title: 'Launch Mimosa-Server'
            },{
              id: 2,
              done: false,
              title: 'Extend Todo-App'
            }
          ]),
          'template': TodoCollectionTemplate
        })
      )

      console.log app.MainRegion