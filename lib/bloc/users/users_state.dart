import 'package:bloc_example_jscarl/models/users.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class UserState extends Equatable {
  const UserState();
  
  @override
  List<Object> get props => [];
}

class UserEmpty extends UserState {}

class UserLoading extends UserState{}

class UserLoaded extends UserState{
  final List<Users> users;

  const UserLoaded({@required this.users}):assert(users != null);
  
  @override
  List<Object> get props => [users];
}

class UserError extends UserState{
  final error;

  const UserError({@required this.error});

  @override
  List<Object> get props => [error];
}