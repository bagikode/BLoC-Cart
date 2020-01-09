import 'package:bloc/bloc.dart';
import 'package:bloc_example_jscarl/models/users.dart';
import 'package:bloc_example_jscarl/repository/user_repository.dart';
import 'package:flutter/material.dart';
import './users.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository repository;

  UserBloc({@required this.repository}):assert(repository != null);

  @override
  UserState get initialState => UserEmpty();

  @override
  Stream<UserState> mapEventToState(UserEvent event) async*{
    if(event is FetchUser) {
      yield UserLoading();
      try {
        final List<Users> users = await repository.fetchUsers();
        yield UserLoaded(users: users);
      } catch(e) {
        yield UserError(error: e);
      }
    }
  }

}