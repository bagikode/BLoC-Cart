import 'package:bloc_example_jscarl/bloc/blogger/blogger_bloc.dart';
import 'package:bloc_example_jscarl/bloc/blogger/blogger_event.dart';
import 'package:bloc_example_jscarl/bloc/blogger/blogger_state.dart';
import 'package:bloc_example_jscarl/bloc/cart/cart_bloc.dart';
import 'package:bloc_example_jscarl/bloc/cart/cart_event.dart';
import 'package:bloc_example_jscarl/bloc/cart/cart_state.dart';
import 'package:bloc_example_jscarl/models/items.dart';
import 'package:bloc_example_jscarl/screens/listcart_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class BlogList extends StatefulWidget {

  @override
  _BlogListState createState() => _BlogListState();
}

class _BlogListState extends State<BlogList> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CartBloc>(
          create: (context) => CartBloc()..add(LoadCart()),
        ),
      ],
      child: Scaffold(
          appBar: AppBar(
            title: Text('Show Blog'),
            actions: <Widget>[
              InkWell(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                        return BlocProvider(
                          create: (context) =>
                              CartBloc()..add(LoadCart()),
                          child: MyCart(),
                        );
                      }));
                 },
                  child: Icon(Icons.shopping_cart),
              ),
              SizedBox(
                width: 20.0,
              ),
            ],
          ),
          body: BlocBuilder<BloggerBloc, BloggerState>(
              bloc: BlocProvider.of<BloggerBloc>(context),
              builder: (context, snapshot){
                if(snapshot is BloggerEmpty){
                  BlocProvider.of<BloggerBloc>(context).add(FetchBlogger());
                }
                if(snapshot is BloggerError){
                  return Center(child: Text("Failed fetch blogger ${snapshot.error}"));
                }
                if(snapshot is BloggerLoaded){
                  return ListView.builder(
                    itemCount: snapshot.bloggers.length,
                      itemBuilder: (context, index){
                      final blogger = snapshot.bloggers[index];
                      return Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text('${blogger.id}'),
                            Text('${blogger.name}'),
                            Text('${blogger.body}'),
                            Text('${blogger.email}'),
                            Container(
                              child: Row(
                                children: <Widget>[
                                  _MyListItem(Item(item: blogger)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                      }
                  );
                }
                return Center(child: CircularProgressIndicator());
              }
          ),
        ),
    );
  }
}

class _AddButton extends StatelessWidget {
  final Item item;

  const _AddButton({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoading) {
          return CircularProgressIndicator();
        }
        if (state is CartLoaded) {
          return FlatButton(
            onPressed: state.items.contains(item)
                ? null
                : (){
              BlocProvider.of<CartBloc>(context).add(AddItem(item));
              print(state.items.toString());
              print(state.totalPrice);
            },
            splashColor: Theme.of(context).primaryColor,
            child: state.items.contains(item)
                ? Icon(Icons.check, semanticLabel: 'ADDED')
                : Text('ADD'),
          );
        }
        return Text('Something went wrong!');
      },
    );
  }
}

class _MyListItem extends StatelessWidget {
  final Item items;

  const _MyListItem(this.items, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        child: Column(
          children: <Widget>[
            _AddButton(item: items)
          ],
        ),
      ),
    );
  }
}
