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

  String getImage(int apiId) {
    if ((apiId >= 200) && (apiId < 300)) {
      return 'Framethunderstrom.png';
    } else if ((apiId >= 200) && (apiId < 300)) {
      return 'Framethunderstrom.png';
    } else if ((apiId >= 300) && (apiId < 400)) {
      return 'Framedrizle.png';
    } else if ((apiId >= 500) && (apiId < 600)) {
      return 'Framerain.png';
    } else if ((apiId >= 600) && (apiId < 700)) {
      return 'Framesnow.png';
    } else if ((apiId >= 700) && (apiId < 800)) {
      return 'Framewind.png';
    } else if (apiId == 800) {
      return 'Framesun.png';
    } else if ((apiId > 800) && (apiId < 900)) {
      return 'Framecloudy.png';
    } else
      return 'nothing';
  }
}
