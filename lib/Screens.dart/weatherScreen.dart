import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:weather_app/colors%20and%20theme/colors.dart';
import 'package:weather_app/models/hourly.dart';

import 'package:weather_app/utils/backgroundColors.dart';
import 'package:weather_app/utils/getWeatherIcon.dart';
import 'package:weather_app/utils/weather_data_location.dart';

import 'package:weather_app/widgets/main_weather.dart';

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String cityname = 'Lucknow';
  String weatherMessage = 'Please wait while we are gathering WeatherData';
  double temperature = 0.0;
  IconData weatherIcon = CupertinoIcons.clear;
  int condition = 00;
  int humidity = 000;
  double windSpeed = 0.0;

  @override
  void initState() {
    super.initState();
    getWeather();
    WeatherData().fore(context);
  }

  dynamic getWeather() async {
    var weather = await WeatherData().getLocationWeather();
    setState(() {
      temperature = weather['main']['temp'];

      condition = weather['weather'][0]['id'];
      weatherIcon = WeatherIcon().getWeatherIcon(condition);
      cityname = weather['name'];
      weatherMessage = weather['weather'][0]['main'];
      print(weatherMessage);
      humidity = weather['main']['humidity'];
      windSpeed = weather['wind']['speed'];
    });
  }

  dynamic getForecast() async {
    var weather = WeatherData().fore(context);
    print(weather);
    return weather;
  }

  @override
  void dispose() {
    super.dispose();
    getWeather();
    WeatherData().fore(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: BGColor().getBgColor(condition))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: ListTile(
            tileColor: Colors.transparent,
            title: Text(
              cityname.toString(),
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20.0,
                  color: kTextcolr),
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.location_on,
              ),
              onPressed: () {
                WeatherData().getLocationWeather();
              },
            ),
          ),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MainWeather(
                weatherIcon: weatherIcon,
                message: weatherMessage,
                temp: temperature.toInt(),
                humidity: humidity,
                speed: windSpeed,
              ),

              //add forecast data containers
              Container(
                alignment: Alignment.bottomLeft,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FutureBuilder<Hourly>(
                          future: getForecast(),
                          // ignore: non_constant_identifier_names
                          builder: (context, AsyncSnapshot) {
                            if (AsyncSnapshot.hasData) {
                              return Text(AsyncSnapshot.data!.temp!.toString());
                            } else if (AsyncSnapshot.hasError) {
                              return Text('${AsyncSnapshot.hasError}');
                            }
                            return CircularProgressIndicator();
                          })
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class CityHeader extends StatelessWidget {
//   const CityHeader({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       tileColor: Colors.transparent,
//       title: Text(
//         Provider.of<realData>(context).getrealWeatherData(),
//         style: TextStyle(
//             fontWeight: FontWeight.w500, fontSize: 20.0, color: kTextcolr),
//       ),
//       trailing: IconButton(
//         icon: Icon(
//           Icons.location_on,
//         ),
//         onPressed: () {},
//       ),
//     );
//   }
// }
