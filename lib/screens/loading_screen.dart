// import 'dart:html';

import 'package:climac/services/location.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
  }

  //  api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=a24cffa1713095d4afd649dda636114d
  // http://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=a24cffa1713095d4afd649dda636114d
  void getData() async {
    final apiKey = "a24cffa1713095d4afd649dda636114d";
    final requestUrl =
        "http://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=${apiKey}";

    final http.Response respone = await http.get(Uri.parse(requestUrl));

    if (respone.statusCode == 200) {
      String data = respone.body;
      print(data);
    } else {
      print(respone.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold();
  }
}
