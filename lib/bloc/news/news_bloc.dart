import 'dart:async';
import 'package:bloc_example_jscarl/models/news.dart';
import 'package:bloc_example_jscarl/repository/news_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './news.dart';
import '../bloc.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository repository;

  NewsBloc({@required this.repository}) : assert(repository != null);

  @override
  NewsState get initialState => NewsEmpty();

  @override
  Stream<NewsState> mapEventToState(NewsEvent event) async* {
    if (event is LoadNewsEvent && !_hasReachedMax(state)) {
      try {
        if (state is NewsEmpty) {
          final List<News> news =
          await repository.fetchNews(0, 12);
          yield NewsLoaded(news: news, hasReachedMax: false);
          return;
        }
        if (state is NewsLoaded) {
          final List<News> newNews =
          await repository.fetchNews((state as NewsLoaded).news.length, 5);
          yield newNews.isEmpty
              ? (state as NewsLoaded).copyWith(hashReachedMax: true)
              : NewsLoaded(news:
              (state as NewsLoaded).news + newNews,
              hasReachedMax: (state as NewsLoaded).news.length >= 50 ? true : false);
        }
      } catch (e) {
        yield NewsError(error: e);
      }
    }
  }

  bool _hasReachedMax(NewsState state) =>
      state is NewsLoaded && state.hasReachedMax;
}
