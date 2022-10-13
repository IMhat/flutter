import 'dart:convert';


TaskModel taskModelFromJson(String str) => TaskModel.fromJson(json.decode(str));
String taskModelToJson(TaskModel data) => json.encode(data.toJson());

class TaskModel {
  TaskModel({
    this.id,
    this.title,
    this.description,
  });

  String? id;
  String? title;
  String? description;

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
      };
}
