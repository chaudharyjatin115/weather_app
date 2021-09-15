import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class WeatherModel extends ChangeNotifier {
  Icon getWeatherIcon(
    int condition,
  ) {
    if (condition < 300) {
      return Icon(CupertinoIcons.cloud_rain);
    } else if (condition == 800) {
      return Icon(CupertinoIcons.sun_max);
    } else if (condition <= 804) {
      return Icon(CupertinoIcons.cloud_heavyrain);
    } else if (condition < 700) {
      return Icon(CupertinoIcons.cloud_snow_fill);
    } else if (condition < 600) {
      return Icon(CupertinoIcons.cloud_bolt_rain);
    } else {
      notifyListeners();
      return Icon(CupertinoIcons.cloud);
    }
  }

  String getMessage(double temp) {
    if (temp > 25) {
      return 'Its so cold ';
    } else if (temp > 20) {
      return 'weather would be nice today';
    } else if (temp > 30) {
      return 'Its too hot';
    } else if (temp < 10) {
      return 'its frozing here';
    } else {
      notifyListeners();
      return 'cant help anymore';
    }
  }
}
