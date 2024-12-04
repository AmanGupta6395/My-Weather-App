import 'dart:math';
import 'package:flutter_gradient_app_bar/flutter_gradient_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class Home extends StatefulWidget {
   const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    print('This is init State');
  }
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    print('setState Called');
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('Widget Destroyed');
  }
  @override
  Widget build(BuildContext context) {

    List cityname = ["Mumbai","Delhi", "chennai", "Ahmedabad", "Hongkong","Ladakh"];
    final _random = new Random();
    var city = cityname[_random.nextInt(cityname.length)];
    Map  info = ModalRoute.of(context)?.settings.arguments as Map;
    String temp = (info['temp_value'].toString());
    String airspeed = (info["air_value"].toString());
    if(temp =="NA"){
      print("NA");
    }else{
      temp = temp.substring(0,4);
      airspeed = airspeed.substring(0,3);
    }

    String  icon = info["icon_value"];
    String getcity = info["city_value"];
    String hum = info["hum_value"];
    String desc = info["des_value"];
    // String main = info["main_value"];

    return  Scaffold(
      backgroundColor: Colors.blue,
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: GradientAppBar(
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors:[
                Colors.blueAccent,
                Colors.blue
              ] ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                  Colors.blue.shade800,
                  Colors.blue.shade300
                    ]
                )
              ),
          child: Column(
            children: [
              //search Container
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.white,
                ),

                child: Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        if((searchController.text).replaceAll(" ", "")== ""){
                          print("Blank search");
                        }else {
                          Navigator.pushReplacementNamed(context, "/loading", arguments: {
                            "searchText": searchController.text,
                          });
                        }
                      },
                        child: Container(child: const Icon(Icons.search,color: Colors.blueAccent),margin: const EdgeInsets.fromLTRB(3,0, 7, 0),)
                    ),
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        textInputAction: TextInputAction.search,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search $city',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 150,
                      margin: const EdgeInsets.symmetric(horizontal: 25),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(26.0),
                        child: Row(
                          children: [
                            Image.network("https://openweathermap.org/img/wn/$icon@2x.png"),
                            const SizedBox(
                             width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('$desc',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 30,)),
                                Text(" in $getcity",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                              ],
                            )
                          ],
                        ),
                      )
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 180,
                       margin: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(14)
                      ),
                          child: Padding(padding: const EdgeInsets.all(26.0),
                          child:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(WeatherIcons.thermometer,size: 30,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("$temp",style: const TextStyle(fontSize: 50),),
                                  const Text("C",style: TextStyle(fontSize: 30),),
                                ],
                              )
                            ],
                          ))
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      height: 165,
                        margin: const EdgeInsets.fromLTRB(25,0,10,30),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(14)
                        ),
                        child:  Padding(padding: const EdgeInsets.all(16.0),
                            child:Column(
                              children: [
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(WeatherIcons.cloudy_windy),
                                  ],
                                ),
                                Text("$airspeed",style: const TextStyle(fontSize: 45,fontWeight: FontWeight.bold),),
                                const Text("Km/hr",style: TextStyle(fontSize: 20),)
                              ],
                            )
                    ),
                  )
                  ),
                  Expanded(
                    child: Container(
                      height: 165,
                        margin: const EdgeInsets.fromLTRB(0, 0, 25, 30),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(14)
                        ),
                        child:  Padding(padding: const EdgeInsets.all(16.0),
                            child:Column(
                              children: [
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(WeatherIcons.humidity),
                                  ],
                                ),
                                Text("$hum",style: const TextStyle(fontSize: 45,fontWeight: FontWeight.bold),),
                                const Text("Percent",style: TextStyle(fontSize: 20),)
                              ],
                            )
                        ),
                  ),
                  )],
              ),
              const SizedBox(
                height: 30,
              ),
              const Text('Made By Aman',style: TextStyle(color: Colors.white,fontSize: 20),),
              const Text("Data Provided By Openweathermap.org",style: TextStyle(color: Colors.white,fontSize: 15),)
            ],

          ),
        )),
      ),
    );
  }
}

