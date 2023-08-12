// To parse this JSON data, do
//
//     final todomodel = todomodelFromJson(jsonString);

import 'dart:convert';

List<Todomodel> todomodelFromJson(String str) => List<Todomodel>.from(json.decode(str).map((x) => Todomodel.fromJson(x)));

String todomodelToJson(List<Todomodel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Todomodel {
    int? userId;
    int? id;
    String? title;
    bool? completed;

    Todomodel({
        this.userId,
        this.id,
        this.title,
        this.completed,
    });

    factory Todomodel.fromJson(Map<String, dynamic> json) => Todomodel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "completed": completed,
    };
}


