import 'package:flutter/material.dart';
import 'package:weather_app/Screens.dart/weatherScreen.dart';
import 'package:weather_app/colors%20and%20theme/colors.dart';
import 'package:weather_app/utils/weather_data_location.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
    WeatherData().fore(context);
  }

  void getLocationData() async {
    var weatherData = await WeatherData().getLocationWeather();

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => WeatherScreen(weatherData)),
        (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kClearSkyBottom,
      body: SafeArea(
        child: Center(
          child: Container(
            child: CircularProgressIndicator(
              color: Colors.amber,
            ),
          ),
        ),
      ),
    );
  }
}
