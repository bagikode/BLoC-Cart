import 'package:bloc_example_jscarl/models/news.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => null;
}

class NewsEmpty extends NewsState {}

class NewsLoading extends NewsState {}

class NewsLoaded extends NewsState {
  final List<News> news;
  final bool hasReachedMax;

  NewsLoaded({@required this. news, @required this.hasReachedMax}):assert(news != null);

  NewsLoaded copyWith({
    List<News>  news,
    bool hashReachedMax
  }) => NewsLoaded( news:  news ?? this. news, hasReachedMax: hashReachedMax ?? this.hasReachedMax);

  @override
  List<Object> get props => [ news, hasReachedMax];

  @override
  String toString() => ' newsLoaded { items: ${ news.length}, hashReachedMax: $hasReachedMax }';
}

class NewsError extends NewsState {
  final error;

  NewsError({@required this.error});

  @override
  List<Object> get props => [error];
}
