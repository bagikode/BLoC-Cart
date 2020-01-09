import 'dart:convert';
import 'package:bloc_example_jscarl/models/blogger.dart';
import 'package:http/http.dart' as http;

class BloggerServices {

  static final BloggerServices _instance = BloggerServices._internal();
  factory BloggerServices(){
    return _instance;
  }
  BloggerServices._internal();

  final String baseUrl = "https://jsonplaceholder.typicode.com/comments";

  Future<List<Blogger>> fetchBlogger() async {

    final response = await http.get("$baseUrl");

    if(response.statusCode == 200){
      List bloggerJson = jsonDecode(response.body);
      return bloggerJson.map((json) => Blogger.fromJson(json)).toList();
    } else{
      throw Exception("Error getting blog ${response.body}");
    }

  }

}