import 'package:flutter/material.dart';
import 'package:myweather_app/Activity/home.dart';
import 'package:myweather_app/Activity/loading.dart';
import 'package:myweather_app/Activity/loading.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      "/" : (context) => Loading(),
      "/home" : (context) => Home(),
      "/loading" : (context) => Loading(),
    },
  ));
}


