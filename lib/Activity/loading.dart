import 'package:flutter/material.dart';
import 'package:myweather_app/Activity/home.dart';
import 'package:myweather_app/Activity/location.dart';
import 'package:myweather_app/Worker/worker.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  late String tempp ;
  late String hum ;
  late String air_speed;
  late String desc ;
  late String main ;

  void startApp() async
  {
    worker instance = worker(location: "London");
    await instance.getData();

    tempp = instance.temp;
    hum = instance.humidity;
    air_speed = instance.humidity;
    desc = instance.description;
    main = instance.main;

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'temp_value' : tempp,
      'hum_value' : hum,
      'air_speed_value' : air_speed,
      'desc_value' : desc,
      'main_value' : main
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
      body: SafeArea(
        child: Column(
          children: <Widget>[
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, "/home");
            },
                child: Text("Loading !! "))
          ],
        ),
      )
    );
  }
}