import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_2/bloc/post/bloc.dart';
import 'package:flutter_app_2/model/post/post.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  //PostBloc _postBloc;

  @override
  void initState() {
    super.initState();
    // Can be used if we need to add further events
    //_postBloc = BlocProvider.of<PostBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        if (state is PostError) {
          return Center(
            child: Text('Failed to fetch events'),
          );
        }
        if (state is PostLoaded) {
          if (state.posts.isEmpty) {
            return Center(
              child: Text('No events'),
            );
          }
          return _listView(state.posts);
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget _listView(List<Post> events) {
    return ListView.builder(
      itemCount: events.length,
      itemBuilder: (context, index) {
        return Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                trailing: Image(image: AssetImage('assets/engineering.png')),
                title: Text(events[index].name),
                subtitle: Text(events[index]?.desc ?? ""),
              ),
              ButtonBar(
                children: <Widget>[
                  FlatButton(
                    child: const Text('INTERESTED'),
                    onPressed: () {
                      /* ... */
                    },
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
