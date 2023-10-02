import 'package:flutter/material.dart';
import 'package:myweather_app/Worker/worker.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  late String temp;
  late String hum;
  late String air_speed;
  late String desc;
  late String main;

  void startApp() async {
    worker instance = worker(location: "ballia");
    await instance.getData();

    setState(() {
      temp = instance.temp;
      hum = instance.humidity;
      air_speed = instance.air_speed;
      desc = instance.description;
      main = instance.main;

      Navigator.pushReplacementNamed(context, '/home', arguments:{
        'temp_value': temp,
        'hum_value' : hum,
        'air_speed_value' : air_speed,
        'desc_value' : desc,
        'main_value' : main
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    startApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Text("Hello There !!")),
    );
  }
}
