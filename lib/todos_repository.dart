import 'dart:async';
import 'dart:convert';
import 'package:smile_todo/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoRepository {
  static final String SP_TODO_KEY = "todo_key";

  ///获取所有Todo
  static Future<List<Todo>> getAllTodo() async {
    List<Todo> todoList = [];
    SharedPreferences sp = await SharedPreferences.getInstance();
    List<String> jsonTodo = sp.getStringList(SP_TODO_KEY);
    if (jsonTodo == null) return todoList;
    for (String value in jsonTodo) {
      todoList.add(Todo.fromJson(JsonDecoder().convert(value)));
    }
    return todoList;
  }

  /// 添加一个Todo
  static void addTodo(Todo todo) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    List<String> todoJson = sp.getStringList(SP_TODO_KEY);
    if (todoJson == null) todoJson = [];
    todoJson.add(JsonEncoder().convert(todo));
    sp.setStringList(SP_TODO_KEY, todoJson);
  }

  ///删除一个 Todo
  static void removeTodo(int index) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    List<String> todoJson = sp.getStringList(SP_TODO_KEY);
    if (todoJson == null) return;
    todoJson.removeAt(index);
    sp.setStringList(SP_TODO_KEY, todoJson);
  }

  static void clearAll() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
  }
}
