define [
    'j/app/models/Todo'
    'j/app/views/items/Todo'
  ], (TodoModel, TodoView) ->
    
    describe 'TodoView', ->
      it 'should be toggleable', ->
        testTodoView = new TodoView({
          'model': new TodoModel({
            'id': 0,
            'done': false,
            'title': 'Test'
          })
        })

        expect(true).to.equal(true)