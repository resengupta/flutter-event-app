import 'package:flutter/material.dart';

class Post {
  final String id;
  final String name;
  final String desc;
  final String date;

  Post(
      {@required this.id,
      @required this.name,
      @required this.desc,
      @required this.date});

  factory Post.fromJSON(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      name: json['name'],
      desc: json['desc'],
      date: json['date'],
    );
  }
}
