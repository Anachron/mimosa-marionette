define [
    'backbone',
    'backbone.marionette',
    'hbs!t/app/items/TodoListItem'
  ], (Backbone, Marionette, TodoListItemTemplate) ->
    
    TodoListItemView = Marionette.ItemView.extend({
      template: TodoListItemTemplate
    })