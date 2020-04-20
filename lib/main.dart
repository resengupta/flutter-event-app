import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_2/bloc/post/bloc.dart';
import 'package:flutter_app_2/bloc/simple_bloc_delegate.dart';
import 'package:flutter_app_2/repository/post_repository_impl.dart';
import 'package:flutter_app_2/screen/landing_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Posts'),
        ),
        body: BlocProvider(
          create: (context) => PostBloc(
              postRepository: PostRepositoryImpl(httpClient: http.Client()))
            ..add(Fetch()),
          child: LandingScreen(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            /* ... */
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
