import 'package:flutter/material.dart';
import 'package:flutter_app_2/model/post/post.dart';

class DataContent {
  final List<Post> upcomingEvents;

  DataContent({@required this.upcomingEvents});

  factory DataContent.fromJSON(Map<String, dynamic> json) {
    return DataContent(
        upcomingEvents:
            json['upcomingEvents'].map<Post>((i) => Post.fromJSON(i)).toList());
  }
}
