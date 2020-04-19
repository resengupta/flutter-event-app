import 'package:flutter/material.dart';
import 'package:flutter_app_2/model/post/dataContent.dart';

class Response {
  final DataContent dataContent;

  Response({@required this.dataContent});

  factory Response.fromJSON(Map<String, dynamic> json) {
    return Response(dataContent: DataContent.fromJSON(json['dataContent']));
  }
}
