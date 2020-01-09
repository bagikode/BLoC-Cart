import 'dart:convert';

import 'package:bloc_example_jscarl/models/users.dart';
import 'package:http/http.dart' as http;

class UserServices {
  static final UserServices _instances = UserServices._internal();
  factory UserServices() { return _instances; }
  UserServices._internal();


  final String baseUrl = "https://jsonplaceholder.typicode.com/users";

  Future<List<Users>> fetchUsers() async {
    final response = await http.get(baseUrl);
    if(response.statusCode != 200 ){ 
      throw Exception("Error getting users ${response.body}");
    }
    List userJson = jsonDecode(response.body);
    return userJson.map((json) => Users.fromJson(json)).toList();
  }
}