import 'dart:ui';
import 'package:clima/widgets/iconbox.dart';
import 'package:clima/main.dart';
import 'package:clima/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'city_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:clima/services/weather.dart';
import 'package:clima/widgets/gradientbutton.dart';

class Screen1 extends StatefulWidget {
  //final as the state is immutable
  final apiWeatherData, apiAqiData;
  Screen1({required this.apiWeatherData, required this.apiAqiData});
  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  WeatherModel weather = WeatherModel();
  int? apiTemp = 0;
  String? apiCity = 'unknown city';
  int? apiWind = 0;
  String? apiAqi = 'N/A';
  int? apiHumidity = 0;
  String? apiWeather = 'N/A';
  Color? aqiColor = Colors.white;

  @override
  void initState() {
    super.initState();
    updateUiValues();
  }

  void updateUiValues() {
    double demo = widget.apiWeatherData['main']['temp'];
    apiCity = widget.apiWeatherData['name'];
    apiTemp = demo.toInt();
    var demo2 = widget.apiWeatherData['wind']['speed'];
    apiWind = demo2.toInt();
    apiWeather = widget.apiWeatherData['weather'][0]['description'];
    apiHumidity = widget.apiWeatherData['main']['humidity'];
    int aqiLevel = widget.apiAqiData['list'][0]['main']['aqi'];
    apiAqi = weather.getAqi(aqiLevel);
    aqiColor = weather.getAqiColor(aqiLevel);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(45)),
                  gradient: LinearGradient(
                      colors: [Colors.teal, Colors.lightBlue],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight)),
              child: Column(children: [
                Column(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(height: 10.0),
                      Text(apiCity!.toString(),
                          style: GoogleFonts.poppins(color: Colors.white)),
                      SizedBox(height: 10.0),
                      Image.asset('images/Framedrizle.png'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(apiTemp.toString(), style: kTempTextStyle),
                          Text('°C', style: kTempTextStyle)
                        ],
                      ),
                      Text(apiWeather!.toUpperCase(), style: kWeatherTextStyle),
                      SizedBox(height: 10.0),
                      Text('Monday, 1 May 2021', style: kDateTextStyle),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Divider(
                          color: Colors.white,
                          thickness: 0.7,
                          height: 30.0,
                        ),
                      ),
                    ]),
                Expanded(
                  child: Row(children: [
                    IconBox(
                        apiData: Text(
                          '$apiWind Km/hr',
                          style: kIconDataTextStyle,
                        ),
                        iconName: FontAwesomeIcons.wind,
                        labelText: 'WiND'),
                    IconBox(
                        apiData: Text(apiAqi.toString(),
                            style: TextStyle(
                                color: aqiColor,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600)),
                        labelText: 'Air Quality Index',
                        iconName: CupertinoIcons.speedometer),
                    IconBox(
                        apiData: Text(apiHumidity.toString(),
                            style: kIconDataTextStyle),
                        labelText: 'HUMIDITY',
                        iconName: FontAwesomeIcons.tint),
                  ]),
                ),
              ]),
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 0, 12.0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GradientButton(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyApp()));
                  },
                  buttonText:
                      Text('LIVE LOCATION DATA', style: kButtonTextStyle),
                  buttonIcon: Icon(
                    FontAwesomeIcons.syncAlt,
                    size: 14.0,
                  ),
                  gradientColor2: Colors.greenAccent,
                  gradientColor1: Colors.blueAccent,
                  topLeft: 20.0,
                  topRight: 20.0,
                ),
                SizedBox(height: 2.0),
                GradientButton(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CityScreen()));
                  },
                  buttonText: Text('SEARCH BY CITY', style: kButtonTextStyle),
                  buttonIcon: Icon(FontAwesomeIcons.search, size: 14.0),
                  gradientColor1: Colors.greenAccent,
                  gradientColor2: Colors.blueAccent,
                  bottomLeft: 20.0,
                  bottomRight: 20.0,
                )
              ],
            ),
          ),
          SizedBox(height: 25.0),
        ]),
      ),
    ));
  }
}
