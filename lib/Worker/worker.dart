import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Worker
{
  String location;

  //Constructor
  Worker({required this.location})
  {
    location = location;
  }
  late String temp;
  late String humidity;
  late String airspeed;
  late String description;
  late String main;
  late String icon;
  //method

  Future<void> getData()async{
    try{
  Response response = await get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$location&appid=153adfa0340d897b593f871a9de82b1d"));
  Map data = jsonDecode(response.body);


  //Getting temp,humidity
  Map temp_data = data['main'];
  int get_humidity = temp_data['humidity'];
  double get_temp = temp_data['temp']-273.15;


  //Getting airspeed
  Map wind_data = data['wind'];
  double get_airspeed = wind_data['speed']/0.27777777777778;


  //Getting Description
  List weather_data = data['weather'];
  Map weather_main_data = weather_data[0];
  String get_main_des = weather_main_data['main'];
  String get_desc = weather_main_data['description'];
  String get_icon = weather_main_data['icon'].toString();

  //Assigning Value
  temp = get_temp.toString();
  humidity = get_humidity.toString();
  airspeed = get_airspeed.toString();
  description = get_desc;
  main = get_main_des;
  icon = get_icon;
  }
  catch(e) {
    temp = "NA";
    humidity = "NA";
    airspeed = "NA";
    description = "NA";
    main = "NA";
    icon = "09d";
  }
  }
}