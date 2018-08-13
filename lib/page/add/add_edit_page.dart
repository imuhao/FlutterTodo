import 'package:flutter/material.dart';
import 'package:smile_todo/widgets/add_edit_view.dart';
import 'package:smile_todo/todos_repository.dart';
import 'package:smile_todo/models.dart';

class AddEditPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _taskTitleKey = GlobalKey<FormFieldState<String>>();
  final _taskNoteKey = GlobalKey<FormFieldState<String>>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Todo "),
      ),
      body: AddEditView(_formKey, _taskTitleKey, _taskNoteKey),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          child: Icon(Icons.add),
          onPressed: () {
            addOrEditTodo();
            Navigator.of(context).pop();
          }),
    );
  }

  addOrEditTodo() {
    final form = _formKey.currentState;
    if (form.validate()) {
      final title = _taskTitleKey.currentState.value;
      final note = _taskNoteKey.currentState.value;
      TodoRepository.addTodo(Todo(title, note: note));
    }
  }
}
