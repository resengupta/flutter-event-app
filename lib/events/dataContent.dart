import 'package:flutter/material.dart';
import 'package:flutter_app_2/events/events.dart';

class DataContent {
  final List<Events> upcomingEvents;

  DataContent({@required this.upcomingEvents});

  factory DataContent.fromJSON(Map<String, dynamic> json) {
    return DataContent(
        upcomingEvents:
            json['upcomingEvents'].map<Events>((i) => Events.fromJSON(i)).toList());
  }
}
