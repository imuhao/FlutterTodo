import 'package:smile_todo/util/uuid.dart';

class Todo {
  Todo(this.title, {this.complete = false, this.note = "", String id}) {
    //为空就自己生成
    this.id == id ?? Uuid().generateV4();
  }
//qq
  bool complete;
  String id;
  String title;
  String note;

  Todo.fromJson(Map<String, dynamic> json) {
    complete = json["complete"];
    id = json["id"];
    title = json["title"];
    note = json["note"];
  }
  Map<String, dynamic> toJson() => {
        "complete": complete,
        "id": id,
        "title": title,
        "note": note,
      };
}
