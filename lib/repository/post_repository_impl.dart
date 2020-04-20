import 'dart:async';
import 'dart:convert';
import 'dart:core';

import 'package:flutter_app_2/model/post/post.dart';
import 'package:flutter_app_2/model/post/response.dart';
import 'package:flutter_app_2/repository/post_repository.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

class PostRepositoryImpl implements PostRepository {
  final http.Client httpClient;

  const PostRepositoryImpl({@required this.httpClient});

  @override
  Future<List<Post>> fetchPosts() async {
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
