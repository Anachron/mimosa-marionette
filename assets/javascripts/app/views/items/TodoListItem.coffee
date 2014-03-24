define [
    'backbone',
    'backbone.marionette',
    'hbs!t/templates/app/items/TodoListItem'
  ], (Backbone, Marionette, TodoListItemTemplate) ->
    
    TodoListItemView = Marionette.ItemView.extend({
      template: TodoListItemTemplate
    })