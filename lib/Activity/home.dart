import 'dart:convert';
import 'package:myweather_app/Worker/worker.dart';
import 'package:flutter/material.dart';
import 'package:myweather_app/Activity/loading.dart';
import 'package:myweather_app/Activity/loading.dart';
import 'package:http/http.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("This is init state !!");
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    print("Set State Called !!");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("Dispose State Called");
  }

  @override
  Widget build(BuildContext context) {

    Map? info = ModalRoute.of(context)?.settings.arguments as Map?;

    return Scaffold(
        appBar: AppBar(
          title: Text("Home Activity"),
        ),
        body: SafeArea(
            child: Column(
          children: <Widget>[
            FloatingActionButton(
              onPressed: () {},
            ),
            Text(info?["temp_value"]),

          ],
        )));
  }
}
