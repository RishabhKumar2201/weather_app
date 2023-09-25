import 'package:http/http.dart';
import 'dart:convert';

class worker{
  String location = '';
  String temp = '';
  String humidity = '';
  String air_speed = '';
  String description = '';
  String main = '';

  //Constructor
  worker({required this.location}){
    location = this.location;
  }


  Future<void> getData() async
  {
    try{
      Response response = await get("http://api.openweathermap.org/data/2.5/weather?q=$location&appid=51f3041e24f88a86bc102ae3642954ea" as Uri);
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
      String getMain_desc = weather_main_data['main'];
      String getDesc = weather_main_data['description'];

      //ASSIGNING VALUES
      temp = getTemp.toString();
      humidity = getHumidity;
      air_speed = getAir_speed.toString();
      description = getDesc.toString();
      main = getMain_desc.toString();

    }catch (e){
      temp = "Can't find Data";
      humidity = "Can't find Data";
      air_speed = "Can't find Data";
      description = "Can't find Data";
      main = "Can't find Data";

    }
  }
}