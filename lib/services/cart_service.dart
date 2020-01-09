import 'dart:convert';
import 'package:bloc_example_jscarl/models/blogger.dart';
import 'package:http/http.dart' as http;

class CartServices {

  static final CartServices _instance = CartServices._internal();
  factory CartServices(){
    return _instance;
  }
  CartServices._internal();

  final String baseUrl = "https://jsonplaceholder.typicode.com/comments";

  Future<List<Blogger>> fetchCart() async {

    final response = await http.get("$baseUrl");

    if(response.statusCode == 200){
      List bloggerJson = jsonDecode(response.body);
      return bloggerJson.map((json) => Blogger.fromJson(json)).toList();
    } else{
      throw Exception("Error getting blog ${response.body}");
    }

  }

}