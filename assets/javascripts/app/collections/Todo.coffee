define [
    'backbone',
    'j/app/models/Todo'
  ], (Backbone, TodoModel) ->
    
    TodoCollection = Backbone.Collection.extend({
      model: TodoModel
    })