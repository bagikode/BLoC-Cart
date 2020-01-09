import 'package:equatable/equatable.dart';

abstract class CharactersEvent extends Equatable {
  const CharactersEvent();

  @override
  List<Object> get props => [];
}

class LoadCharactersEvent extends CharactersEvent {
  @override
  String toString() => 'Fetch Characters';
}