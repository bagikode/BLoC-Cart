import 'package:bloc_example_jscarl/bloc/bloc.dart';
import 'package:bloc_example_jscarl/models/news.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsList extends StatefulWidget {
  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {

  final _scrollController = ScrollController(initialScrollOffset: 0.0, keepScrollOffset: true);

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        BlocProvider.of<NewsBloc>(context).add(LoadNewsEvent());
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Characters Bloc")),
      body: BlocBuilder<NewsBloc, NewsState>(
        bloc: BlocProvider.of<NewsBloc>(context),
        builder: (context, state){
          if(state is NewsEmpty) {
            BlocProvider.of<NewsBloc>(context).add(LoadNewsEvent());
          }
          if(state is NewsError){
            return Center(child: Text("Failed fetch user ${state.error}"));
          }
          if(state is NewsLoaded){
            return ListView.builder(
              controller: _scrollController,
              itemCount: state.hasReachedMax ? state.news.length : state.news.length + 1,
              itemBuilder: (context, index){
                // final characters = state.characters[index];
                return index >= state.news.length ?
                BottomLoader() :
                NewsWidget(news: state.news[index]);
              },
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class BottomLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Center(
        child: SizedBox(
          width: 33,
          height: 33,
          child: CircularProgressIndicator(
            strokeWidth: 1.5,
          ),
        ),
      ),
    );
  }
}

class NewsWidget extends StatelessWidget {
  final News news;
  NewsWidget({Key key, @required this.news}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('${news.id}'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('${news.title}'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('${news.body}'),
          ),
        ],
      ),
    );
  }
}