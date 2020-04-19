import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_app_2/bloc/post/bloc.dart';
import 'package:flutter_app_2/model/post/post.dart';
import 'package:flutter_app_2/model/post/response.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final http.Client httpClient;

  PostBloc({@required this.httpClient});

  @override
  get initialState => PostUninitialized();

  @override
  Stream<PostState> transformEvents(
      Stream<PostEvent> events, Stream<PostState> Function(PostEvent p1) next) {
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 500)),
      next,
    );
  }

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    final currentState = state;
    if (event is Fetch) {
      try {
        if (currentState is PostUninitialized) {
          final posts = await _fetchPosts();
          yield PostLoaded(posts: posts);
          return;
        }
      } catch (_) {
        yield PostError();
      }
    }
  }

  Future<List<Post>> _fetchPosts() async {
    final response = await httpClient
        .get('https://69chzojzla.execute-api.us-east-2.amazonaws.com/Prod/');
    if (response.statusCode == 200) {
      return Response.fromJSON(jsonDecode(response.body))
          .dataContent
          .upcomingEvents;
    } else {
      throw Exception('error fetching posts');
    }
  }
}
