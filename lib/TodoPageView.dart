import 'package:flutter/material.dart';
import 'package:smile_todo/TodoPage.dart';

import 'DataUtils.dart';
import 'Bean.dart';

class TodoPageView extends TodoPageState {
  List<Todo> todos = [];

  void loadData() {
    DataUtil.getAllTodo().then((list) {
      setState(() {
        todos = list;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    loadData();
    return MaterialApp(
      title: "TODO",
      theme: ThemeData(primaryColor: Colors.green),
      home: Scaffold(
        backgroundColor: Colors.green[100],
        appBar: AppBar(
          centerTitle: true,
          title: Text("TODO"),
        ),
        body: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Flexible(
                  child: Card(
                    margin: const EdgeInsets.all(10.0),
                    elevation: 4.0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: TextField(
                        style: TextStyle(color: Colors.black54, height: 1.2),
                        controller: textEditingController,
                        decoration: InputDecoration(
                            hintText: 'What do you need to do ?',
                            border: InputBorder.none),
                        onSubmitted: addTodo,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: RaisedButton(
                    textColor: Colors.white,
                    color: Colors.green,
                    child: const Text(
                      "DONE",
                      style: TextStyle(fontSize: 15.0),
                    ),
                    elevation: 6.0,
                    onPressed: () => addTodo(textEditingController.text),
                  ),
                )
              ],
            ),
            Expanded(
                child: ListView.builder(
              itemBuilder: (_, index) => Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 12.0,
                        backgroundColor: Colors.green,
                        child: Text((index + 1).toString()),
                      ),
                      title: Text(todos[index].name),
                      trailing: InkWell(
                        child: Icon(Icons.delete),
                        onTap: () => remove(index),
                      ),
                    ),
                  ),
              itemCount: todos.length,
            )),
          ],
        ),
      ),
    );
  }
}
