import 'dart:convert';

class Task {
  late String title;
  late String priority;
  late String description;
  // late List<String> images;
  late int points;
  late String category;
  late String assignmentUser;
  late String status;
  late String createdBy;
  late String startDate;
  late String endDate;
  late String id;
  Task(
    this.title,
    this.priority,
    this.description,
    // this.images,
    this.startDate,
    this.endDate,
    this.points,
    this.category,
    this.assignmentUser,
    this.status,
    this.createdBy,
    this.id,
  );
  factory Task.fromJson(String str) => Task.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  Task.fromMap(Map<String, dynamic> map) {
    title = map['title'];
    priority = map['priority'];
    description = map['description'];
    // points =
    // map['quantity']?.toDouble() ?? 0.0;
    // images  =
    // List<String>.from(map['images']);
    // images = map['images'];
    startDate = map['startDate'];
    endDate = map['endDate'];
    points = map['points'];
    category = map['category'];
    assignmentUser = map['assignmentUser'];
    status = map['status'];
    createdBy = map['createdBy'];
    id = map['_id'];
  }

  Map<String, dynamic> toMap() => {
        "title": title,
        "priority": priority,
        "description": description,
        // "images": images,
        "startDate": startDate,
        "endDate": endDate,
        "points": points,
        "category": category,
        "assignmentUser": assignmentUser,
        "status": status,
        "createdBy": createdBy,
        "_id": id,
      };

  Task copy() => Task(
        title,
        priority,
        description,
        // images,
        startDate,
        endDate,
        points,
        category,
        assignmentUser,
        status,
        createdBy,
        id,
      );

  then(Null Function(dynamic value) param0) {}
}
