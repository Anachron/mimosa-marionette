define [
    'backbone',
    'backbone.marionette',
    'j/app/views/items/Todo',
    'hbs!t/app/collections/Todo'
  ], (Backbone, Marionette, TodoView, TodoCollectionTemplate) ->
    
    TodoCollectionView = Marionette.CollectionView.extend({
      template: TodoCollectionTemplate,
      itemView: TodoView,
      className: 'todo list'
    })