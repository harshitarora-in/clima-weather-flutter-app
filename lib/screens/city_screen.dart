import 'package:clima/services/networking.dart';
import 'package:clima/utilities/constants.dart';
import 'screen1.dart';
import 'package:flutter/material.dart';
import 'package:clima/widgets/gradientbutton.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String? cityName = 'palam';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(children: [
          Container(
              padding: EdgeInsets.fromLTRB(14, 0, 14, 0),
              height: 270.0,
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(45)),
                  gradient: LinearGradient(
                      colors: [Colors.teal, Colors.lightBlue],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 40.0),
                    Text('ENTER CITY',
                        style: TextStyle(color: Colors.white, fontSize: 28.0)),
                    SizedBox(height: 40.0),
                    TextField(
                      decoration: kInputDecorationStyle,
                      onChanged: (value) {
                        cityName = value;
                      },
                    ),
                    SizedBox(height: 20.0),
                    GradientButton(
                      onTap: () async {
                        NetworkHelper networkHelper = NetworkHelper(
                            url:
                                '${kOpenWeatherUrl}weather?q=$cityName&appid=$kApiKey&units=metric');
                        var weatherData = await networkHelper.getData();
                        var cityLon = weatherData['coord']['lon'];
                        var cityLat = weatherData['coord']['lat'];
                        NetworkHelper networkHelper2 = NetworkHelper(
                            url:
                                '${kOpenWeatherUrl}air_pollution?lat=$cityLat&lon=$cityLon&appid=$kApiKey');
                        var aqiData = await networkHelper2.getData();

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Screen1(
                                      apiWeatherData: weatherData,
                                      apiAqiData: aqiData,
                                    )));
                      },
                      buttonText: Text('SHOW DETAILS',
                          style:
                              TextStyle(color: Colors.black, fontSize: 14.0)),
                      buttonIcon: Icon(
                        FontAwesomeIcons.arrowRight,
                        color: Colors.black,
                        size: 14.0,
                      ),
                      gradientColor2: Colors.white,
                      gradientColor1: Colors.white70,
                      bottomLeft: 20.0,
                      bottomRight: 20.0,
                      //paddingTop: 20.0,
                    ),
                  ])),
          //Text('data')
        ]),
      ),
    );
  }
}

// TODO add slider like bhim app
