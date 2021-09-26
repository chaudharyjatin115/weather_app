import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class WeatherIcon {
  static IconData getWeatherIcon(
    int condition,
  ) {
    if (condition < 233) {
      return WeatherIcons.thunderstorm;
    } else if (condition == 800) {
      return WeatherIcons.day_sunny;
    } else if (condition > 801) {
      return WeatherIcons.day_cloudy;
    } else if (condition > 600) {
      return CupertinoIcons.snow;
    } else if (condition < 322) {
      return WeatherIcons.raindrops;
    } else if (condition > 500) {
      return WeatherIcons.rain;
    } else if (condition == 711) {
      return WeatherIcons.smoke;
    } else if (condition == 721) {
      return WeatherIcons.day_haze;
    } else if (condition == 741) {
      return WeatherIcons.fog;
    } else if (condition == 761) {
      return WeatherIcons.dust;
    } else if (condition == 781) {
      return WeatherIcons.tornado;
    } else if (condition == 761) {
      return CupertinoIcons.cloud_fog;
    } else if (condition == 751) {
      return WeatherIcons.sandstorm;
    }
    return WeatherIcons.cloud;
  }
}
