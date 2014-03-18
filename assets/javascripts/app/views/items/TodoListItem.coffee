define [
    'backbone',
    'marionette'
    'hbs!/templates/app/Todo'
  ], (Backbone, Marionette, TodoListItemTemplate) ->
    
    TodoListItemView = Marionette.ItemView.extend({
      template: TodoListItemTemplate
    })