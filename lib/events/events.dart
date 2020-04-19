import 'package:flutter/material.dart';

class Events {
  final String id;
  final String name;
  final String desc;
  final String date;

  Events(
      {@required this.id,
      @required this.name,
      @required this.desc,
      @required this.date});

  factory Events.fromJSON(Map<String, dynamic> json) {
    return Events(
      id: json['id'],
      name: json['name'],
      desc: json['desc'],
      date: json['date'],
    );
  }
}
