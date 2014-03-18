define [
    'backbone',
    'marionette',
    '/javascripts/app/views/items/TodoListItem',
    'hbs!/templates/app/collections/TodoListTemplate'
  ], (Backbone, Marionette, TodoListItemView, TodoListTemplate) ->
    
    TodoListView = Marionette.CollectionView.extend({
      template: TodoListTemplate,
      itemView: TodoListItemView
    })