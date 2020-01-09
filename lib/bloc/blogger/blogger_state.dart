import 'package:bloc_example_jscarl/models/blogger.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class BloggerState extends Equatable{
  const BloggerState();

  @override
  List<Object> get props => [];
}

class BloggerEmpty extends BloggerState{}

class BloggerLoading extends BloggerState{}

//class BloggerAddCart extends BloggerState{}

class BloggerLoaded extends BloggerState{
  final List<Blogger> bloggers;

  const BloggerLoaded({@required this.bloggers}):assert(bloggers != null);

  @override
  List<Object> get props => [bloggers];
}

class BloggerError extends BloggerState{
  final error;

  const BloggerError({@required this.error});

  @override
  List<Object> get props => [error];
}