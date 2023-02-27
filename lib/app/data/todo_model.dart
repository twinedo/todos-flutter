import 'dart:convert';

TodoModel todoModelFromJson(String str) => TodoModel.fromJson(json.decode(str));

String todoModelToJson(TodoModel data) => json.encode(data.toJson());

class TodoModel {
  TodoModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.completed,
  });

  int id;
  int userId;
  String title;
  bool completed;

  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
      id: json["id"],
      userId: json['userId'],
      title: json['title'],
      completed: json['completed']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['title'] = title;
    data['completed'] = completed;
    return data;
  }
}
