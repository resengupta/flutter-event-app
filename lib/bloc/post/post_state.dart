import 'package:equatable/equatable.dart';
import 'package:flutter_app_2/model/post/post.dart';

abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

class PostUninitialized extends PostState {}

class PostError extends PostState {}

class PostLoaded extends PostState {
  final List<Post> posts;

  const PostLoaded({this.posts});

  @override
  List<Object> get props => [posts];

  @override
  String toString() => 'PostLoaded { posts: ${posts.length} }';
}
