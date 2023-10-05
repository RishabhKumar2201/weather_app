import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:collection';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = new TextEditingController();
  late String searched;

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
    //Object? info = ModalRoute.of(context)?.settings.arguments;
    var info =
    ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    String air_speed = (info?['air_speed_value']).toString().substring(0, 5);
    String temp = info?['temp_value'];
    String humidity = (info?['hum_value']);
    String main = info?['main_value'];
    String des = info?['desc_value'];
    String icon = info?['icon_value'];
    String location = info?['city_value'];

    return Scaffold(
      //resizeToAvoidBottomInset: false,
        appBar: AppBar(
          toolbarHeight: 0,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.greenAccent,
                  Colors.lightGreen,
                ], // Replace with your gradient colors
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
        body: /* RefreshIndicator(
              onRefresh: _refreshTemp,
              child: */
        SingleChildScrollView(
          child: SafeArea(
              child: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.pinkAccent, Colors.lightGreenAccent],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight)),
                child: Column(
                  children: [
                    Container(
                      //Search Wala Container

                      padding: EdgeInsets.symmetric(horizontal: 8),
                      margin:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24)),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (searchController.text == '' ||
                                  searchController.text == ' ' ||
                                  searchController.text == '  ' ||
                                  searchController.text == '   ' ||
                                  searchController.text == '    ') {
                                print("Blank Search");
                              } else {
                                Navigator.pushReplacementNamed(
                                  context,
                                  "/loading",
                                  arguments: searchController.text,
                                );
                              }
                            },
                            child: Container(
                              child: Icon(
                                Icons.search,
                                color: Colors.blueAccent,
                              ),
                              margin: EdgeInsets.fromLTRB(3, 0, 7, 0),
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              controller: searchController,
                              textInputAction: TextInputAction.search,
                              onSubmitted: (value) {
                                if (value == '' ||
                                    value == ' ' ||
                                    value == '  ' ||
                                    value == '   ' ||
                                    value == '    ') {
                                  print("Irrilivent Search");
                                } else {
                                  Navigator.pushReplacementNamed(
                                    context,
                                    "/loading",
                                    arguments: searchController.text,
                                  );
                                }
                              },
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Search Your City Name !!"),
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 25),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white.withOpacity(0.5),
                              ),
                              child: Row(

                                children: [
                                  Image.network(
                                      "https://openweathermap.org/img/wn/$icon@2x.png"),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        des,
                                        style: TextStyle(
                                            fontSize: 21,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'in ' + location,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22),
                                      )
                                    ],
                                  ),
                                ],
                              )),
                        ),
                      ],
                    ),
                    /*Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 300,
                            margin:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white.withOpacity(0.5),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          "assets/thermo.png",
                                          height: 110,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          temp,
                                          style: TextStyle(
                                              fontSize: 60,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "   \u00B0C",
                                          style: TextStyle(fontSize: 40),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )

                        //Text("Temp11")
                      ],
                    ),*/
                    Row(
                      children: [
                        Expanded(
                            child: Container(
                              height: 300,
                              margin:
                              EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white.withOpacity(0.5),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Image.asset("assets/thermo.png",
                                        height: 100,
                                      ),
                                    ],
                                  ),
                                  Text('$temp',
                                    style: TextStyle(
                                        fontSize: 60,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text("   \u00B0C",
                                      style: TextStyle(fontSize: 40))
                                ],
                                
                              ),
                              
                            ))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Container(
                              height: 200,
                              //width: 150,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 10),
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white.withOpacity(0.5),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.wind_power_outlined,
                                        size: 35,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Text(
                                    air_speed,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold, fontSize: 30),
                                  ),
                                  Text(
                                    "Km/h",
                                    style: TextStyle(
                                        fontSize: 18, fontWeight: FontWeight.w400),
                                  ),
                                ],
                              )),
                        ),
                        Expanded(
                          child: Container(
                              height: 200,
                              //width: 150,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 10),
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white.withOpacity(0.5),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.water_drop_outlined,
                                        size: 35,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Text(
                                    humidity + " %",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold, fontSize: 30),
                                  ),
                                  Text(
                                    "Humidity",
                                    style: TextStyle(
                                        fontSize: 18, fontWeight: FontWeight.w400),
                                  ),
                                ],
                              )),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Made With 💖 By Rishabh",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "Referenced from CodeWithDhruv",
                      style: TextStyle(fontSize: 11),
                    ),
                  ],
                ),
              )),
        ));
  }
}
