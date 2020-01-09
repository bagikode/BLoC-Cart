import 'dart:convert';

List<News> newsFromJson(String str) => List<News>.from(json.decode(str).map((x) => News.fromJson(x)));

String newsToJson(List<News> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class News {
  int userId;
  int id;
  String title;
  String body;

  News({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  factory News.fromJson(Map<String, dynamic> json) => News(
    userId: json["userId"] == null ? null : json["userId"],
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    body: json["body"] == null ? null : json["body"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId == null ? null : userId,
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "body": body == null ? null : body,
  };
}
