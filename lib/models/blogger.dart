import 'dart:convert';

List<Blogger> bloggerFromJson(String str) => List<Blogger>.from(json.decode(str).map((x) => Blogger.fromJson(x)));

String bloggerToJson(List<Blogger> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Blogger {
  int postId;
  int id;
  String name;
  String email;
  String body;

  Blogger({
    this.postId,
    this.id,
    this.name,
    this.email,
    this.body,
  });

  factory Blogger.fromJson(Map<String, dynamic> json) => Blogger(
    postId: json["postId"] == null ? null : json["postId"],
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    email: json["email"] == null ? null : json["email"],
    body: json["body"] == null ? null : json["body"],
  );

  Map<String, dynamic> toJson() => {
    "postId": postId == null ? null : postId,
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "email": email == null ? null : email,
    "body": body == null ? null : body,
  };
}

class BloggerCart{
  Blogger item;
  int jumlah;

  BloggerCart({this.item, this.jumlah});

  @override
  String toString() {
    return "Nama: " + item.name + ", Jumlah: " + jumlah.toString();
  }

}
