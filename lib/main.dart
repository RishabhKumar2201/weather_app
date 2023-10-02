import 'package:flutter/material.dart';
import 'package:myweather_app/Activity/home.dart';
import 'package:myweather_app/Activity/loading.dart';


void main() {
  runApp(MaterialApp(
    routes: {
      "/" : (context) => const Loading(),
      "/home" : (context) => const Home(),

    },
  ));
}


