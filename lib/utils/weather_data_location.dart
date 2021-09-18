import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

import 'package:weather_app/colors%20and%20theme/colors.dart';
import 'package:weather_app/utils/location.dart';
import 'package:weather_app/utils/networking.dart';

class WeatherData extends ChangeNotifier {
  final String apiKey = '9df522183f9f5d00159fd394a1116708';
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

//returns the cupertino weather icon based on condition
  IconData getWeatherIcon(
    int condition,
  ) {
    if (condition < 232) {
      return CupertinoIcons.cloud_bolt_rain;
    } else if (condition == 800) {
      return CupertinoIcons.sun_max;
    } else if (condition <= 804) {
      return CupertinoIcons.cloud_heavyrain;
    } else if (condition < 700) {
      return CupertinoIcons.cloud_snow_fill;
    } else if (condition >= 600) {
      return CupertinoIcons.snow;
    } else if (condition >= 300) {
      return CupertinoIcons.cloud_drizzle;
    } else {
      return CupertinoIcons.cloud;
    }
  }

//returnsmessage based on condition
  String getMessage(int condition) {
    if (condition < 232) {
      return 'ThunderStorm';
    } else if (condition >= 300) {
      return 'Drizzle';
    } else if (condition >= 500) {
      return 'Rain';
    } else if (condition == 800) {
      return 'Clear time to go on a walk';
    } else {
      return 'Cloudy';
    }
  }

//sets the background color based on temperature
  List<Color> getBgColor(int condition) {
    if (condition >= 801) {
      return [kCloudyGradientColorTop, kCloudyGradientColorBottom];
    } else if (condition == 800) {
      return [Colors.yellow, kSunnygradientColorBottom];
    } else if (condition > 500) {
      return [kRainyGradientColorTop, kRainyGradientColorBottom];
      // } else if (condition == ) {
      //   return [Color(0xff20bf55), Color(0xff01baef)];
    } else if (condition > 300) {
      return [knewto, kNewColor];
    } else
      return [kCloudyGradientColorBottom, kCloudyGradientColorBottom];
  }
}




// temprature = decodeData['main']['temp'];
//         humidity = decodeData['main']['humidity'];
//         condition = decodeData['weather'][0]['id'];
//         cityName = decodeData['name'];