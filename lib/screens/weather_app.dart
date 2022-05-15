import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import '../models/weather_data.dart';
import '../store.dart';
import '../widgets/single_weather.dart';

class WeatherApp extends StatefulWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  late String bgImg;
  void getWeather() async {
    Position position;
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    double lat = position.latitude;
    double lon = position.longitude;
    String apiQuery =
        "http://api.openweathermap.org/geo/1.0/reverse?lat=$lat&lon=$lon&appid=71771144cfe6d91034e4d0f1c78e4572";

    var dio = Dio();
    await dio
        .get(apiQuery,
            options: Options(responseType: ResponseType.plain, headers: {
              'Content-Type': 'application/json;charset=UTF-8',
              'Charset': 'utf-8'
            }))
        .then((response) {
      String data = response.data.toString();
      var decodedData = jsonDecode(data);
      cityName = decodedData[0]['name'];
      stateName = decodedData[0]['state'];
    });

    String apiQuery2 =
        "http://api.weatherapi.com/v1/current.json?key=e5749ddbfaa645498b7131358221505&q=$cityName&aqi=no";

    await dio
        .get(apiQuery2,
            options: Options(responseType: ResponseType.plain, headers: {
              'Content-Type': 'application/json;charset=UTF-8',
              'Charset': 'utf-8'
            }))
        .then((response) {
      String data = response.data.toString();
      final weatherData = weatherDataFromJson(data);
      globalWeatherData = weatherData;
      setState(() {
        apiCheck = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    getWeather();

    if (apiCheck) {
      if (globalWeatherData.current!.condition!.text == "Mist") {
        bgImg = 'assets/cloudy.jpeg';
      } else if (globalWeatherData.current!.condition!.text == "Rainy") {
        bgImg = 'assets/rainy.jpg';
      } else if (globalWeatherData.current!.condition!.text == "Sunny") {
        bgImg = 'assets/sunny.jpg';
      } else if (globalWeatherData.current!.condition!.text == "Night") {
        bgImg = 'assets/night.jpg';
      } else {
        bgImg = 'assets/cloudy.jpeg';
      }
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.search,
            size: 30,
            color: Colors.white,
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: GestureDetector(
              onTap: () => print('Menu Clicked!'),
              child: SvgPicture.asset(
                'assets/menu.svg',
                height: 30,
                width: 30,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: apiCheck == false
          ? Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                CircularProgressIndicator(),
                Text('Getting Location ..Loading...'),
              ],
            ))
          : Stack(
              children: [
                Image.asset(
                  bgImg,
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                ),
                Container(
                  decoration: const BoxDecoration(color: Colors.black38),
                ),
                const SingleWeather(1),
              ],
            ),
    );
  }
}
