import 'package:equatable/equatable.dart';

abstract class BloggerEvent extends Equatable {
  const BloggerEvent();
}

class FetchBlogger extends BloggerEvent {
  const FetchBlogger();

  @override
  List<Object> get props => null;

  @override
  String toString() => 'Fetch User';
}

//class LoadCart extends BloggerEvent {
//  const LoadCart();
//
//  @override
//  List<Object> get props => null;
//
//  @override
//  String toString() => 'Get cart';
//}

//class AddCart extends BloggerEvent {
//  final Blogger blogger;
//
//  const AddCart(this.blogger);
//
//  @override
//  List<Object> get props => [blogger];
//
//  @override
//  String toString() => 'AddTodo { todo: $blogger }';
//}

