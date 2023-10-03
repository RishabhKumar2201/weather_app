import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
      Future.delayed(Duration(seconds: 2), (){
        Navigator.pushReplacementNamed(context, '/home', arguments: {
          'temp_value': temp,
          'hum_value': hum,
          'air_speed_value': air_speed,
          'desc_value': desc,
          'main_value': main
        });
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
    return MaterialApp(
      home: Scaffold(
        body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                /*Color(0xff87ceeb),
                Color(0xfff0e68c),*/
                Colors.yellow,
                Colors.indigoAccent,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/loading_image.png", height: 250, width: 250),
              Text(
                "Mausam App",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Made with 💖 by R.K.",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
              ),
              SpinKitThreeInOut(
                color: Colors.white,
                size: 55.0,
              ),
              // Your other content here
            ],
          ),
        ),
      ),
    );
  }
}
