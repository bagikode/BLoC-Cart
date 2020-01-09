import 'dart:convert';
import 'package:bloc_example_jscarl/models/news.dart';
import 'package:http/http.dart' as http;

class NewsServices {
  static final NewsServices _instances =NewsServices._internal();
  factory NewsServices() { return _instances; }
  NewsServices._internal();

  int get currentDate => new DateTime.now().millisecondsSinceEpoch;


  Future<List<News>> getNews(int offset, int limit) async {
    final response = await http.get("http://jsonplaceholder.typicode.com/posts?_start=$offset&_limit=$limit");
    if(response.statusCode == 200) {
      var data = json.decode(response.body);
      List newsJson = data;
      print('kesini dia');
      return newsJson.map((news) => News.fromJson(news)).toList();
    } else {
      throw Exception('Request failed with status: ${response.statusCode} & ${response.body}.');
    }
  }
}