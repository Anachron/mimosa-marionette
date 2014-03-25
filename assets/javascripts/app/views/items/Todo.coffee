define [
    'backbone',
    'backbone.marionette',
    'jquery',
    'hbs!t/app/items/Todo',
    'css!c/app/Todo'
  ], (Backbone, Marionette, $, TodoTemplate) ->
    
    TodoView = Marionette.ItemView.extend({
      'className': 'todo list item'
      'template': TodoTemplate,

      'events': {
        'click label': "toggleDone"
      },

      toggleDone: () ->
        @model.set('done', !@model.get('done'))

        $(@el).toggleClass('done', @model.get('done'))

      onRender: () ->
        if @model.get('done')
          $(@el).addClass('done')
    })