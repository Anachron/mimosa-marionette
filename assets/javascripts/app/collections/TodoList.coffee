define [
    'backbone',
    'j/app/models/Todo'
  ], (Backbone, TodoModel) ->
    
    TodoListCollection = Backbone.Collection.extend({
      model: TodoModel
    })