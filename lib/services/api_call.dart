// import 'dart:convert';
// import 'package:dio/dio.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:weather_app/models/weather_data.dart';

// import '../store.dart';

// void getWeather() async {
//   Position position;
//   position = await Geolocator.getCurrentPosition(
//       desiredAccuracy: LocationAccuracy.high);
//   double lat = position.latitude;
//   double lon = position.longitude;
//   String apiQuery =
//       "http://api.openweathermap.org/geo/1.0/reverse?lat=$lat&lon=$lon&appid=71771144cfe6d91034e4d0f1c78e4572";

//   var dio = Dio();
//   await dio
//       .get(apiQuery,
//           options: Options(responseType: ResponseType.plain, headers: {
//             'Content-Type': 'application/json;charset=UTF-8',
//             'Charset': 'utf-8'
//           }))
//       .then((response) {
//     String data = response.data.toString();
//     var decodedData = jsonDecode(data);
//     cityName = decodedData[0]['name'];
//     stateName = decodedData[0]['state'];
//   });

//   String apiQuery2 =
//       "http://api.weatherapi.com/v1/current.json?key=e5749ddbfaa645498b7131358221505&q=$cityName&aqi=no";

//   await dio
//       .get(apiQuery2,
//           options: Options(responseType: ResponseType.plain, headers: {
//             'Content-Type': 'application/json;charset=UTF-8',
//             'Charset': 'utf-8'
//           }))
//       .then((response) {
//     String data = response.data.toString();
//     final weatherData = weatherDataFromJson(data);
//     globalWeatherData = weatherData;
//     apiCheck = true;
//   });
// }
