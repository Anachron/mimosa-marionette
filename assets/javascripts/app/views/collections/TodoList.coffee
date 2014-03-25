define [
    'backbone',
    'backbone.marionette',
    'j/app/views/items/TodoListItem',
    'hbs!t/app/collections/TodoListTemplate'
  ], (Backbone, Marionette, TodoListItemView, TodoListTemplate) ->
    
    TodoListView = Marionette.CollectionView.extend({
      template: TodoListTemplate,
      itemView: TodoListItemView
    })