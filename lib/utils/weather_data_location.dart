import 'package:flutter/cupertino.dart';

import 'package:weather_app/colors%20and%20theme/colors.dart';
import 'package:weather_app/utils/location.dart';
import 'package:weather_app/utils/networking.dart';

class WeatherData extends ChangeNotifier {
  final String apiKey = '9df522183f9f5d00159fd394a1116708';
  double? latitude;
  double? longitu;

  String cityname = 'NewDelhi';
  double? temprature;
  var humidity;
  int? condition;

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  IconData getWeatherIcon(
    int condition,
  ) {
    if (condition >= 200) {
      return CupertinoIcons.cloud_bolt_rain;
    } else if (condition == 800) {
      return CupertinoIcons.sun_max;
    } else if (condition <= 804) {
      return CupertinoIcons.cloud_heavyrain;
    } else if (condition < 700) {
      return CupertinoIcons.cloud_snow_fill;
    } else if (condition >= 600) {
      return CupertinoIcons.snow;
    } else {
      return CupertinoIcons.cloud;
    }
  }

  String getMessage(int condition) {
    if (condition >= 200) {
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

  List<Color> getBgColor(int condition) {
    if (condition <= 801) {
      return [kCloudyGradientColorTop, kCloudyGradientColorBottom];
    } else if (condition == 800) {
      return [ksunnygradientColorTop, ksunnygradientColorTop];
    } else if (condition < 600) {
      return [kRainyGradientColorTop, kRainyGradientColorBottom];
    } else {
      return [Color(0xffecc38f), Color(0xfffbdd7c)];
    }
  }
}




// temprature = decodeData['main']['temp'];
//         humidity = decodeData['main']['humidity'];
//         condition = decodeData['weather'][0]['id'];
//         cityName = decodeData['name'];