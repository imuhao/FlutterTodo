import 'package:flutter/material.dart';
import 'package:smile_todo/models.dart';

class TodoItem extends StatelessWidget {
  Todo todo;
  final index;

  TodoItem(this.todo, this.index);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          radius: 12.0,
          backgroundColor: Colors.green,
          child: Text((index + 1).toString()),
        ),
        title: Text(todo.title),
        subtitle: Text(todo.note),
        trailing: InkWell(
          child: Icon(Icons.delete),
          onTap: () {
//            remove(index)
          },
        ),
      ),
    );
  }
}
