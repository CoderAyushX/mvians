// To parse this JSON data, do
//
//     final qoutes = qoutesFromJson(jsonString);

import 'dart:convert';

Qoutes qoutesFromJson(String str) => Qoutes.fromJson(json.decode(str));

class Qoutes {
  Qoutes({
    required this.id,
    required this.content,
    required this.author,
    required this.tags,
    required this.authorSlug,
    required this.length,
    required this.dateAdded,
    required this.dateModified,
  });

  String id;
  String content;
  String author;
  List<String> tags;
  String authorSlug;
  int length;
  DateTime dateAdded;
  DateTime dateModified;

  factory Qoutes.fromJson(Map<String, dynamic> json) => Qoutes(
        id: json["_id"],
        content: json["content"],
        author: json["author"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        authorSlug: json["authorSlug"],
        length: json["length"],
        dateAdded: DateTime.parse(json["dateAdded"]),
        dateModified: DateTime.parse(json["dateModified"]),
      );
}
