// To parse this JSON data, do
//
//     final auther4 = auther4FromJson(jsonString);

import 'dart:convert';

List<Auther4> auther4FromJson(String str) => List<Auther4>.from(json.decode(str).map((x) => Auther4.fromJson(x)));

String auther4ToJson(List<Auther4> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Auther4 {
  Auther4({
    required this.userId,
    required this.id,
    required  this.title,
    required this.body,
  });

  int userId;
  int id;
  String title;
  String body;

  factory Auther4.fromJson(Map<String, dynamic> json) => Auther4(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "body": body,
  };
}
