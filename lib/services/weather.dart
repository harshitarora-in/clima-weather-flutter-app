import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeatherModel {
  String getAqi(int aqiLevel) {
    if (aqiLevel == 1) {
      return 'Good';
    } else if (aqiLevel == 2) {
      return 'Fair';
    } else if (aqiLevel == 3) {
      return 'Moderate';
    } else if (aqiLevel == 4) {
      return 'Poor';
    } else if (aqiLevel == 5) {
      return 'Very Poor';
    } else
      return 'N/A';
  }

  Color getAqiColor(int aqiLevel) {
    if (aqiLevel == 1) {
      return Colors.limeAccent;
    } else if (aqiLevel == 2) {
      return Colors.green;
    } else if (aqiLevel == 3) {
      return Colors.yellowAccent;
    } else if (aqiLevel == 4) {
      return Colors.orange;
    } else if (aqiLevel == 5) {
      return Colors.red;
    } else
      return Colors.white;
  }
}
