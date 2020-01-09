import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_example_jscarl/models/marvels.dart';
import 'package:bloc_example_jscarl/repository/character_repository.dart';
import 'package:flutter/material.dart';
import './characters.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  final CharacterRepository repository;

  CharactersBloc({@required this.repository}) : assert(repository != null);

  @override
  CharactersState get initialState => CharactersEmpty();

  @override
  Stream<CharactersState> mapEventToState(CharactersEvent event) async* {
    if (event is LoadCharactersEvent && !_hasReachedMax(state)) {
      try {
        if (state is CharactersEmpty) {
          final List<Characters> characters =
              await repository.fetchCharacters(0, 12);
          yield CharactersLoaded(characters: characters, hasReachedMax: false);
          return;
        }
        if (state is CharactersLoaded) {
          final List<Characters> newCharacters =
              await repository.fetchCharacters((state as CharactersLoaded).characters.length, 5);
          yield newCharacters.isEmpty
            ? (state as CharactersLoaded).copyWith(hashReachedMax: true)
            : CharactersLoaded(
                characters:
                    (state as CharactersLoaded).characters + newCharacters,
                hasReachedMax: (state as CharactersLoaded).characters.length >= 50 ? true : false);
        }
      } catch (e) {
        yield CharactersError(error: e);
      }
    }
  }

  bool _hasReachedMax(CharactersState state) =>
      state is CharactersLoaded && state.hasReachedMax;
}
