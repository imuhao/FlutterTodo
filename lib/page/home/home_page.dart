import 'package:flutter/material.dart';
import 'package:smile_todo/models.dart';
import 'package:smile_todo/todos_repository.dart';
import 'package:smile_todo/widgets/add_edit_view.dart';
import 'package:smile_todo/routes.dart';
import 'package:smile_todo/widgets/todo_item.dart';

class TodoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TodoPageView();
  }
}

class TodoPageView extends State<TodoPage> {
  List<Todo> todoList = [];
  void loadData() {
    TodoRepository.getAllTodo().then((list) {
      setState(() {
        todoList = list;
      });
    });
  }

  void remove(int index) {
    setState(() {
      TodoRepository.removeTodo(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    loadData();
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        title: Text("Todo List"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: ListView.builder(
            itemBuilder: (_, index) => TodoItem(todoList[index], index),
            itemCount: todoList.length,
          )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed(TODORoutes.addEditTodo);
        },
        backgroundColor: Colors.green,
      ),
    );
  }
}
