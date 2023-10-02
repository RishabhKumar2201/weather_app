import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int counter = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("This is init state !!");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("Dispose State Called");
  }

  @override
  Widget build(BuildContext context) {
    Object? info = ModalRoute.of(context)?.settings.arguments;

    return Scaffold(
        appBar: AppBar(
          title: Text("Home Activity"),
        ),
        body: SafeArea(
            child: Column(
          children: [
            FloatingActionButton(
              onPressed: () {},
            ),
            if (info is Map && info.containsKey('temp_value'))
              Text(info['temp_value'].toString())
            else
              Text('Default Value'),
          ],
        )
        )
    );
  }
}
