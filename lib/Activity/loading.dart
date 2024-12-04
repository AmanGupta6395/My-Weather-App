import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/Worker/worker.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String city = "Delhi";
  late String temp;
  late String hum;
  late String air;
  late String des;
  late String main;
  late String icon;

  void startapp(String city)async
  {
    Worker instance = Worker(location: city);
    await instance.getData();

    temp = instance.temp;
    hum = instance.humidity;
    air = instance.airspeed;
    des = instance.description;
    main = instance.main;
    icon = instance.icon;
    Navigator.pushNamed(context,"/home",arguments: {
      "temp_value" : temp,
      "hum_value" : hum,
      "air_value" : air,
      "des_value" : des,
      "main_value": main,
      "icon_value": icon,
      "city_value": city,
    }
    );

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Map? search = ModalRoute.of(context)!.settings.arguments as Map?;

    if(search?.isNotEmpty ?? false){
      city = search!["searchText"];
    }
    startapp(city);

    return  Scaffold(
      backgroundColor: Colors.blue.shade400,
      body:Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/weather-clear-icon.png',height: 240, width: 180,),
              const Text('Weather Report', style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 30,
                color: Colors.white
              ),),
              const SizedBox(
                height: 10,
              ),
              const Text('Created By Aman',style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),),
              const SizedBox(
                height: 20,
              ),
              const SpinKitWave(
                color: Colors.black38,
                size: 50.0,
              )
            ],
          ),
        ),
      )
    );
  }
}




