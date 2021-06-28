import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kApiKey = 'c7af5988ba36e2d1e499452d312368e2';
const kOpenWeatherUrl = 'https://api.openweathermap.org/data/2.5/';
const kInputDecorationStyle = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  hintText: 'Enter city name',
  hintStyle: TextStyle(color: Colors.grey),
  border:
      OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
);
const kButtonTextStyle = TextStyle(color: Colors.white, fontSize: 14.0);
const kIconLabelTextStyle = TextStyle(color: Colors.white70, fontSize: 14.0);
const kIconDataTextStyle =
    TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.w600);
const kCityTextStyle =
    TextStyle(fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.w500);

final kTempTextStyle = GoogleFonts.poppins(
  fontSize: 80.0,
  color: Colors.white,
  fontWeight: FontWeight.w600,
);

const kWeatherTextStyle = TextStyle(fontSize: 20.0, color: Colors.white);
const kDateTextStyle = TextStyle(fontSize: 14.0, color: Colors.white);
const kMessageTextStyle =
    TextStyle(fontFamily: 'Spartan MB', fontSize: 60.0, color: Colors.white);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);
