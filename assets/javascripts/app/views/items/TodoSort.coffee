define [
    'backbone',
    'backbone.marionette',
    'jquery',
    'hbs!t/app/items/TodoSort'
  ], (Backbone, Marionette, $, TodoSortTemplate) ->
    
    TodoView = Marionette.ItemView.extend({
      'className': 'todo sort'
      'template': TodoSortTemplate,

      'events': {},

      onRender: () ->
        console.log 'all ok'
    })