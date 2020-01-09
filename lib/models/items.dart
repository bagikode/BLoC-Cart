import 'package:bloc_example_jscarl/models/blogger.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class Item extends Equatable {
  final Blogger item;
  final int price = 42;

  Item({this.item});

  @override
  List get props => [item, price];

  @override
  String toString() {
    return "Nama: " + item.name + ", harga: " + price.toString();
  }
}
