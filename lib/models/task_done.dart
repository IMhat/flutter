import 'dart:convert';

class TaskDone {
  late String title;
  late String type;
  late String priority;
  late String description;
  late String user;
  late dynamic points;
  late dynamic done;
  late String id;
  TaskDone(
    this.title,
    this.type,
    this.priority,
    this.description,
    this.user,
    this.points,
    this.done,
    this.id,
  );
  factory TaskDone.fromJson(String str) => TaskDone.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());
  TaskDone.fromMap(Map<String, dynamic> map) {
    title = map['title'];
    type = map['type'];
    priority = map['priority'];
    description = map['description'];
    user = map['user'];
    points = map['points'];
    done = map['done'];
    id = map['id'];
  }

  Map<String, dynamic> toMap() => {
        "title": title,
        "type": type,
        "priority": priority,
        "description": description,
        "user": user,
        "points": points,
        "done": done,
        "id": id,
      };

  TaskDone copy() => TaskDone(
        title,
        type,
        priority,
        description,
        user,
        points,
        done,
        id,
      );

  then(Null Function(dynamic value) param0) {}
}
