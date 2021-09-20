import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeatherIcon {
  IconData getWeatherIcon(
    int condition,
  ) {
    if (condition < 233) {
      return CupertinoIcons.cloud_bolt_rain;
    } else if (condition == 800) {
      return CupertinoIcons.sun_max;
    } else if (condition > 801) {
      return CupertinoIcons.cloud;
    } else if (condition < 700) {
      return CupertinoIcons.cloud_snow_fill;
    } else if (condition < 623) {
      return CupertinoIcons.snow;
    } else if (condition < 322) {
      return CupertinoIcons.cloud_drizzle;
    } else if (condition < 532) {
      return CupertinoIcons.cloud_rain;
    } else if (condition == 711) {
      return CupertinoIcons.smoke;
    } else if (condition == 721) {
      return CupertinoIcons.sun_haze;
    } else if (condition == 741) {
      return CupertinoIcons.cloud_fog;
    } else if (condition == 761) {
      return CupertinoIcons.sun_dust;
    } else if (condition == 781) {
      return CupertinoIcons.tornado;
    } else if (condition == 761) {
      return CupertinoIcons.cloud_fog;
    }
    return CupertinoIcons.cloud;
  }
}
