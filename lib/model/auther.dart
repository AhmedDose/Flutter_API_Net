// To parse this JSON data, do
//
//     final auther = autherFromJson(jsonString);

import 'dart:convert';

Auther autherFromJson(String str) => Auther.fromJson(json.decode(str));

String autherToJson(Auther data) => json.encode(data.toJson());

class Auther {
  Auther({
    required this.name,
    required this.id,
  });

  String name;
  int id;

  factory Auther.fromJson(Map<String, dynamic> json) => Auther(
        name: json["name"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
      };
}
