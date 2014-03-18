define [
    'backbone',
    'backbone.marionette',
    'jquery',
    'hbs!t/app/items/Todo',
    'css!c/app/Todo'
  ], (Backbone, Marionette, $, TodoTemplate) ->
    
    TodoItemView = Marionette.ItemView.extend({
      'template': TodoTemplate,

      'events': {
        'click label': "toggleDone"
      },

      toggleDone: () ->
        $(@el).find('.checkbox').toggleClass('done')

    })