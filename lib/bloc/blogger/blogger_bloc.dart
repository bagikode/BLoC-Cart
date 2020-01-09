import 'package:bloc_example_jscarl/bloc/blogger/blogger_event.dart';
import 'package:bloc_example_jscarl/bloc/blogger/blogger_state.dart';
import 'package:bloc_example_jscarl/models/blogger.dart';
import 'package:bloc_example_jscarl/repository/blogger_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BloggerBloc extends Bloc<BloggerEvent, BloggerState> {
  final BloggerRepository bloggerRepository;
//  final listProductSelected = List<BloggerCart>();

  BloggerBloc({@required this.bloggerRepository}):assert(bloggerRepository != null);

  @override
  BloggerState get initialState => BloggerEmpty();

  @override
  Stream<BloggerState> mapEventToState(BloggerEvent event) async*{
    if(event is FetchBlogger) {
      yield BloggerLoading();
      try {
        final List<Blogger> bloggers = await bloggerRepository.fetchBlogger();
        yield BloggerLoaded(bloggers: bloggers);
      } catch (e) {
        yield BloggerError(error: e);
      }
    }
//    } else if (event is AddCart){
//      Blogger bloggers;
//      yield* cartAdd(event, bloggers);
//    }
  }

//  Stream<BloggerState> cartAdd(AddCart event, Blogger item) async* {
//
//    listProductSelected.add(BloggerCart(item: item, jumlah: 1));
//    print(listProductSelected);
//
//  }
}

