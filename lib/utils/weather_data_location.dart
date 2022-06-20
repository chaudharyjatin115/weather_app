import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:weather_app/models/hourly.dart';

import 'package:weather_app/services/location.dart';
import 'package:weather_app/services/networking.dart';

class WeatherData {
  final String apiKey = '129e7bcd56c263c7c4908ce62ac3f340';

  double? latitude;
  double? longitu;
//get location and weather from open weather servers
  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  Future<List<Hourly>> fore(BuildContext context) async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/onecall?lat=${location.latitude}&lon=${location.longitude}&exclude=current,minutely,daily&appid=$apiKey&units=metric');
    var forecastData = await networkHelper.getData();
    print(Hourly().hourlyfromJson(forecastData));
    return Hourly().hourlyfromJson(forecastData);
  }
  
}

//returns thme cupertino weather icon based on condition

//sets the background color based on temperature

// temprature = decodeData['main']['temp'];
//         humidity = decodeData['main']['humidity'];
//         condition = decodeData['weather'][0]['id'];
//         cityName = decodeData['name'];
