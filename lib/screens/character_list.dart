import 'package:bloc_example_jscarl/bloc/bloc.dart';
import 'package:bloc_example_jscarl/models/marvels.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharacterList extends StatefulWidget {
  @override
  _CharacterListState createState() => _CharacterListState();
}

class _CharacterListState extends State<CharacterList> {

  final _scrollController = ScrollController(initialScrollOffset: 0.0, keepScrollOffset: true);

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        BlocProvider.of<CharactersBloc>(context).add(LoadCharactersEvent());  
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  // void _onScroll() {
  //   var maxScroll = _scrollController.position.maxScrollExtent;
  //   var currentScroll = _scrollController.position.pixels;
  //   if (maxScroll - currentScroll <= _scrollThreshold) {
  //     BlocProvider.of<CharactersBloc>(context).add(LoadCharactersEvent());
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Characters Bloc")),
      body: BlocBuilder<CharactersBloc, CharactersState>(
        bloc: BlocProvider.of<CharactersBloc>(context),
        builder: (context, state){
          if(state is CharactersEmpty) {
            BlocProvider.of<CharactersBloc>(context).add(LoadCharactersEvent());
          }
          if(state is CharactersError){
            return Center(child: Text("Failed fetch user ${state.error}"));
          }
          if(state is CharactersLoaded){
            return ListView.builder(
              controller: _scrollController,
              itemCount: state.hasReachedMax ? state.characters.length : state.characters.length + 1,
              itemBuilder: (context, index){
                // final characters = state.characters[index];
                return index >= state.characters.length ?
                BottomLoader() :
                CharactersWidget(characters: state.characters[index]);
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

class CharactersWidget extends StatelessWidget {
  final Characters characters;
  CharactersWidget({Key key, @required this.characters}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("${characters.name}"),
      subtitle: Text("${characters.description}", maxLines: 2, overflow: TextOverflow.ellipsis, textAlign: TextAlign.justify,),
      leading: CircleAvatar(
        backgroundImage: NetworkImage("${characters.thumbnail.path}.${characters.thumbnail.extension}"),
      ),
    );
  }
}