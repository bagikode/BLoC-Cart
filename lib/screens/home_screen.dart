import 'package:bloc_example_jscarl/bloc/bloc.dart';
import 'package:bloc_example_jscarl/bloc/blogger/blogger_bloc.dart';
import 'package:bloc_example_jscarl/repository/blogger_repository.dart';
import 'package:bloc_example_jscarl/repository/character_repository.dart';
import 'package:bloc_example_jscarl/repository/news_repository.dart';
import 'package:bloc_example_jscarl/repository/repository.dart';
import 'package:bloc_example_jscarl/screens/blogger_list.dart';
import 'package:bloc_example_jscarl/screens/character_list.dart';
import 'package:bloc_example_jscarl/screens/news_list.dart';
import 'package:bloc_example_jscarl/screens/user_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BoxMenu extends StatelessWidget {
  BoxMenu(
      {@required this.label, @required this.onPressed, @required this.icon});
  final Icon icon;
  final String label;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8))),
      child: RaisedButton(
        color: Theme.of(context).primaryColor,
        onPressed: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            icon,
            Text(label, style: TextStyle(fontSize: 16, color: Colors.white))
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({Key key, this.title}) : super(key: key);
  final title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: MultiBlocProvider(
        providers: [
          BlocProvider<UserBloc>(
              create: (context) => UserBloc(repository: UserRepository())),
          BlocProvider<CharactersBloc>(
              create: (context) =>
                  CharactersBloc(repository: CharacterRepository())),
          BlocProvider<NewsBloc>(
              create: (context) =>
                  NewsBloc(repository: NewsRepository())),
          BlocProvider<BloggerBloc>(
              create: (context) =>
                  BloggerBloc(bloggerRepository: BloggerRepository())),
        ],
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: BoxMenu(
                    icon: Icon(Icons.people, size: 64, color: Colors.white),
                    label: "Users Bloc",
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return BlocProvider(
                          create: (context) =>
                              UserBloc(repository: UserRepository()),
                          child: UserList(),
                        );
                      }));
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: BoxMenu(
                    icon: Icon(Icons.nature_people,
                        size: 64, color: Colors.white),
                    label: "Marvel Bloc",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return BlocProvider(
                            create: (context) => CharactersBloc(
                                repository: CharacterRepository()),
                            child: CharacterList(),
                          );
                        }),
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: BoxMenu(
                    icon: Icon(Icons.nature_people,
                        size: 64, color: Colors.white),
                    label: "News Bloc",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return BlocProvider(
                            create: (context) => NewsBloc(
                                repository: NewsRepository()),
                            child: NewsList(),
                          );
                        }),
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: BoxMenu(
                    icon: Icon(Icons.nature_people,
                        size: 64, color: Colors.white),
                    label: "Blogger Bloc",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return BlocProvider(
                            create: (context) => BloggerBloc(
                                bloggerRepository: BloggerRepository()),
                            child: BlogList(),
                          );
                        }),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
