import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:http/http.dart';

class worker{
  late String location;
  //Constructor
  worker({required this.location}){
    location = this.location;
  }

  late String temp;
  late String humidity;
  late String air_speed;
  late String description;
  late String main;

  Future<void> getData() async
  {
    try{
      Response response = await get(Uri.parse("http://api.openweathermap.org/data/2.5/weather?q=$location&appid=51f3041e24f88a86bc102ae3642954ea"));
      Map data = jsonDecode(response.body);

      //Getting temperature and humidity
      Map temp_data = data["main"];
      String getHumidity = temp_data['humidity'].toString();

      double getTemp = temp_data["temp"] - 273.15; // TO GET TEMP IN DEGREE CELSIUS

      //GETTING AIR_SPEED
      Map wind = data["wind"];
      double getAir_speed = wind['speed'] / 0.27777777777778; // TO CONVERT IN KM/H

      //GETTING DESCRIPTION
      List weather_data = data['weather'];
      Map weather_main_data = weather_data[0];
      String getMain_des = weather_main_data['main'];
      String getDesc = weather_main_data['description'];

      //ASSIGNING VALUES
      temp = getTemp.toString().substring(0,5); //C
      humidity = getHumidity; //%
      air_speed = getAir_speed.toString(); //KM/H
      description = getDesc;
      main = getMain_des;

    }catch (e){
      temp = "Can't find Data";
      humidity = "Can't find Data";
      air_speed = "Can't find Data";
      description = "Can't find Data";
      main = "Can't find Data";

    }
  }
}