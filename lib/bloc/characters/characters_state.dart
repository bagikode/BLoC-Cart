import 'package:bloc_example_jscarl/models/marvels.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class CharactersState extends Equatable {
  const CharactersState();
  
  @override
  List<Object> get props => null;
}
  
class CharactersEmpty extends CharactersState {}

class CharactersLoading extends CharactersState {}

class CharactersLoaded extends CharactersState {
  final List<Characters> characters;
  final bool hasReachedMax;

  CharactersLoaded({@required this.characters, @required this.hasReachedMax}):assert(characters != null);

  CharactersLoaded copyWith({
    List<Characters> characters,
    bool hashReachedMax
  }) => CharactersLoaded(characters: characters ?? this.characters, hasReachedMax: hashReachedMax ?? this.hasReachedMax);

  @override
  List<Object> get props => [characters, hasReachedMax];

  @override
  String toString() => 'CharactersLoaded { items: ${characters.length}, hashReachedMax: $hasReachedMax }';
}

class CharactersError extends CharactersState {
  final error;
  
  CharactersError({@required this.error});

  @override
  List<Object> get props => [error];
}
