import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void  main() => runApp(new TodoApp());

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Todo List',
      color: Colors.yellow,
      home: new TodoList()
    );
  }
}

class TodoList extends StatefulWidget {
  @override
  createState() => new TodoListState();
}

class TodoListState extends State<TodoList> {
  List<String> _todoItems = [];
 
  void _addTodoItem(String task) {
    if(task.length > 0) {
     setState(() => _todoItems.add(task));
   }
 }

  void _removeTodoItem(int index) {
    setState(() => _todoItems.removeAt(index));
  }

  void _promptRemoveTodoItem(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return new AlertDialog(
          backgroundColor: Colors.red,
          title: new Text('Mark "${_todoItems[index]}" as done ?'),
          actions: <Widget>[
            new FlatButton(
              child: new Text('CANCEL'),
              color: Colors.blue,
              onPressed: () => Navigator.of(context).pop()
            ),
            new FlatButton(
              child: new Text('MARK AS DONE'),
              color: Colors.blue,
              onPressed: () {
                _removeTodoItem(index);
                Navigator.of(context).pop();
              }
            )
          ]
        );
      }
    );
  }

  Widget _buildTodoList() {
    return new ListView.builder(
      itemBuilder: (context, index) {
        if(index < _todoItems.length) {
          return _buildTodoItem(_todoItems[index], index);
        }
      },
    );
  }

  Widget _buildTodoItem(String todoText, int index) {
    return new ListTile(
      title: new Text(todoText),
      onTap: () => _promptRemoveTodoItem(index)
    );
  }

  Widget build(BuildContext context) {
   return new Scaffold(
     appBar: new AppBar(
      backgroundColor: Colors.red,
      title: new Text('Todo List'),
      shadowColor: Colors.black
     ),
     body: _buildTodoList(),
     floatingActionButton: new FloatingActionButton(
       onPressed: _pushAddTodoScreen,
       tooltip: 'Add task',
       backgroundColor: Colors.red,
       child: new Icon(Icons.add, color: Colors.blue)
     ),
   );
 }

  void _pushAddTodoScreen() {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          return new Scaffold(
            appBar: new AppBar(
              backgroundColor: Colors.red,
              title: new Text('Add a new task')
            ),
            body: new TextField(
              autofocus: true,
              onSubmitted: (val) {
                _addTodoItem(val);
                Navigator.pop(context);
              },
              decoration: new InputDecoration(
                hintText: 'Enter something to do...',
                contentPadding: const EdgeInsets.all(16.0)
              ),
            )
          );
        }
      )
    );
  }
}