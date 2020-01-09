import 'package:bloc_example_jscarl/models/items.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class CartEvent extends Equatable {
  const CartEvent();
}

class LoadCart extends CartEvent {
  @override
  List<Object> get props => [];
}

class AddItem extends CartEvent {
  final Item item;

  const AddItem(this.item);

  @override
  String toString() {
    return "Nama: " + item.item.name+ ", Price: " + item.price.toString();
  }

  @override
  List<Object> get props => [item];
}
