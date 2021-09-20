import 'package:flutter/material.dart';
import 'package:weather_app/colors%20and%20theme/colors.dart';

class BGColor {
  List<Color> getBgColor(int condition) {
    if (condition < 233) {
      return [kRainyGradientColorTop, kCloudyGradientColorBottom];
    } else if (condition == 800) {
      return [kClearSkytop, kClearSkyBottom];
      // } else if (temp > 30) {
      //   return [kRainyGradientColorTop, kSunnygradientColorBottom];
    } else if (condition <= 700) {
      return [ksnowyColorTop, ksnowyColorBottom];
    } else if (condition < 623) {
      return [ksnowyColorTop, ksnowyColorBottom];
    } else if (condition < 322) {
      return [kRainyGradientColorTop, kRainyGradientColorBottom];
    } else if (condition < 532) {
      return [kRainyGradientColorTop, kRainyGradientColorTop];
    } else if (condition == 711) {
      return [kStormColorBottom, kStormColorTop];
    } else if (condition <= 721) {
      return [kCloudyGradientColorBottom, kClearSkytop];
    } else if (condition == 741) {
      return [kFogColorTop, kFogColorBottom];
    } else if (condition == 761) {
      return [ksandColorTop, ksandColorBottom];
    } else if (condition == 781) {
      return [kStormColorTop, kStormColorBottom];
    } else {
      return [kClearSkytop, kClearSkyBottom];
    }
  }
}
