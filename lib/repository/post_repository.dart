import 'package:flutter_app_2/model/post/post.dart';

abstract class PostRepository {
  Future<List<Post>> fetchPosts();
}
