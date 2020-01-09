import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_example_jscarl/bloc/bloc.dart';


class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Users Bloc")),
      body: BlocBuilder<UserBloc, UserState>(
        bloc: BlocProvider.of<UserBloc>(context),
        builder: (context, state) {
          if(state is UserEmpty) {
            BlocProvider.of<UserBloc>(context).add(FetchUser());
          }
          if(state is UserError) {
            return Center(child: Text("Failed fetch user ${state.error}"));
          }
          if(state is UserLoaded) {
            return ListView.builder(
              itemCount: state.users.length,
              itemBuilder: (context, index) {
                final user = state.users[index];
                return ListTile(
                  title: Text("${user.name}"),
                  subtitle: Text("${user.email}"),
                );
              },
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}