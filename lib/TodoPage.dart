import 'package:flutter/material.dart';
import 'package:smile_todo/TodoPageView.dart';
import 'package:smile_todo/Bean.dart';
import 'DataUtils.dart';

class TodoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TodoPageView();
  }
}

abstract class TodoPageState extends State<TodoPage> {
  @protected
  var textEditingController = TextEditingController();
  @protected
  void addTodo(String title) {
    if (title == "") {
      return;
    }
    textEditingController.clear();
    setState(() {
      var todo = Todo(title);
      DataUtil.addTodo(todo);
    });
  }

  @protected
  void remove(int index) {
    setState(() {
      DataUtil.removeTodo(index);
    });
  }
}
