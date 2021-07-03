// import 'dart:html';

import 'package:climac/services/location.dart';
import 'package:flutter/material.dart';
import 'package:climac/services/networking.dart';

//
const apiKey = 'a24cffa1713095d4afd649dda636114d';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double? latitude;
  double? longitude;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;

    NetworkHelper networkHelper = NetworkHelper(
        "http://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=${apiKey}");

    var weatherData = await networkHelper.getData();

    // getData();
  }

  //  api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=a24cffa1713095d4afd649dda636114d
  // http://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=a24cffa1713095d4afd649dda636114d

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
