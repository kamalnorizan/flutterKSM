import 'dart:convert';

List<Todo> fromJson(String str) =>
    List<Todo>.from(json.decode(str).map((x) => Todo.fromJson(x)));

class Todo {
  Todo({
    required this.id,
    required this.title,
    required this.content,
    required this.dueDate,
  });

  late final int id;
  late final String title;
  late final String content;
  late final String dueDate;

  Todo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    dueDate = json['due_date'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['content'] = content;
    _data['due_date'] = dueDate;
    return _data;
  }
}
