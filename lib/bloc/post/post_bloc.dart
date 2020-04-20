import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_app_2/bloc/post/bloc.dart';
import 'package:flutter_app_2/repository/post_repository.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository postRepository;

  PostBloc({@required this.postRepository});

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
          final posts = await postRepository.fetchPosts();
          yield PostLoaded(posts: posts);
          return;
        }
      } catch (_) {
        yield PostError();
      }
    }
  }
}
