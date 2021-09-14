import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/colors%20and%20theme/colors.dart';
import 'package:weather_app/widgets/bottomweatherwidget.dart';

import 'package:weather_app/widgets/city_header.dart';
import 'package:weather_app/widgets/main_weather.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [kCloudyGradientColorTop, kCloudyGradientColorBottom],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: CityHeader(),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MainWeather(),
              Container(
                alignment: Alignment.bottomLeft,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BottomWeatherWidget(),
                    BottomWeatherWidget(),
                    BottomWeatherWidget()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
