import 'package:bloc_example_jscarl/models/blogger.dart';
import 'package:bloc_example_jscarl/services/blogger_services.dart';

class BloggerRepository {
  final BloggerServices bloggerServices = BloggerServices();

  Future<List<Blogger>> fetchBlogger() async {
    return await this.bloggerServices.fetchBlogger();
  }

//  Future<List<Blogger>> loadCart() async {
//    return await this.bloggerServices.fetchCart();
//  }

}