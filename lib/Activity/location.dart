import 'package:flutter/material.dart';
import 'package:myweather_app/Activity/home.dart';
import 'package:myweather_app/Activity/loading.dart';

class Loacation extends StatefulWidget {
  const Loacation({super.key});

  @override
  State<Loacation> createState() => _LoacationState();
}

class _LoacationState extends State<Loacation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Text("Location"),
      )
    );
  }
}
