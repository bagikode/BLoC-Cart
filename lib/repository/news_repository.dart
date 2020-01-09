import 'package:bloc_example_jscarl/models/news.dart';
import 'package:bloc_example_jscarl/services/news_services.dart';


class NewsRepository {
  final NewsServices newsServices = NewsServices();

  Future<List<News>> fetchNews(int offset, int limit) async {
    return await this.newsServices.getNews(offset, limit);
  }
}