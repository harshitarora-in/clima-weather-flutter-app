//import 'package:clima/screens/location_screen.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'screen1.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        url:
            '${kOpenWeatherUrl}weather?lat=${location.latitude}&lon=${location.longitude}&appid=$kApiKey&units=metric');
    NetworkHelper networkHelper2 = NetworkHelper(
        url:
            '${kOpenWeatherUrl}air_pollution?lat=${location.latitude}&lon=${location.longitude}&appid=$kApiKey&units=metric');
    var weatherData = await networkHelper.getData();
    var aqiData = await networkHelper2.getData();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Screen1(
                  apiWeatherData: weatherData,
                  apiAqiData: aqiData,
                )));
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SpinKitRotatingCircle(
        color: Colors.red,
        size: 50.0,
      )),
    );
  }
}
