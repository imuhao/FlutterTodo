class Todo {
  Todo(this.name);

  var name;

  Todo.fromJson(Map<String, dynamic> json) : name = json["name"];

  Map<String, dynamic> toJson() => {"name": name};

}
