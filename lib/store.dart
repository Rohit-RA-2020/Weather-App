import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_data.dart';

const kPrimaryColor = Color(0xFF66BB6A);
const kBackgroundColor = Color(0XFFE5E5E5);

String cityName = "";
String stateName = "";

var apiCheck = false;

WeatherData globalWeatherData = WeatherData();
