import 'package:flutter/material.dart';
import 'package:smile_todo/page/home/home_page.dart';
import 'package:smile_todo/page/add/add_edit_page.dart';

import 'package:smile_todo/routes.dart';

main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TODO",
      theme: ThemeData(primaryColor: Colors.green),
      home: TodoPage(),
      routes: {
        TODORoutes.home: (context) => TodoPage(),
        TODORoutes.addEditTodo: (context) => AddEditPage(),
      },
    );
  }
}
