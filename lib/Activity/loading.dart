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
  late String icon;
  String city = 'Ballia';

  void startApp(String city) async {
    worker instance = worker(location: city);
    await instance.getData();

    setState(() {
      temp = instance.temp;
      hum = instance.humidity;
      air_speed = instance.air_speed;
      desc = instance.description;
      main = instance.main;
      icon = instance.weather_icon;


      Future.delayed(Duration(seconds: 2), (){
        Navigator.pushReplacementNamed(context, '/home', arguments: {
          'temp_value': temp,
          'hum_value': hum,
          'air_speed_value': air_speed,
          'desc_value': desc[0].toUpperCase()+desc.substring(1),
          'main_value': main,
          'icon_value': icon,
          'city_value': city[0].toUpperCase()+city.substring(1)
        });
      });

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    //startApp(city);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Object? search = ModalRoute.of(context)?.settings.arguments;
    if (search is String) {
      city = search as String;
      startApp(city);
      // Now you can safely use 'myString'
    } else {
      startApp(city);
      // Handle the case where 'myObject' is not a String
    }

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
