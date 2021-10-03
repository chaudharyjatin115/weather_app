import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:weather_app/colors%20and%20theme/colors.dart';
import 'package:weather_app/utils/getTimeStamp.dart';
import 'package:weather_app/models/hourly.dart';

import 'package:weather_app/utils/backgroundColors.dart';
import 'package:weather_app/utils/getWeatherIcon.dart';
import 'package:weather_app/utils/weather_data_location.dart';

import 'package:weather_app/widgets/main_weather.dart';

class WeatherScreen extends StatefulWidget {
  final locationweatherdata;
  WeatherScreen(this.locationweatherdata);
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String cityname = 'Lucknow';
  String weatherMessage = 'Gathering WeatherData';
  double temperature = 0.0;
  IconData weatherIcon = CupertinoIcons.clear;
  int condition = 00;
  int humidity = 000;
  double windSpeed = 0.0;

  @override
  void initState() {
    super.initState();
    updateUi(widget.locationweatherdata);
    WeatherData().fore(context);
  }

  void updateUi(dynamic weather) async {
    setState(() {
      temperature = weather['main']['temp'];

      condition = weather['weather'][0]['id'];
      weatherIcon = WeatherIcon.getWeatherIcon(condition);
      cityname = weather['name'];
      weatherMessage = weather['weather'][0]['main'];
      print(weatherMessage);
      humidity = weather['main']['humidity'];
      windSpeed = weather['wind']['speed'];
    });
  }

  Future<List<Hourly>> getForecast() async {
    var weather = WeatherData().fore(context);
    return weather;
  }

  @override
  void dispose() {
    super.dispose();
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
                SizedBox(
                  height: 80.0,
                ),
                Expanded(
                  child: FutureBuilder<List<Hourly>>(
                      future: getForecast(),
                      // ignore: non_constant_identifier_names
                      builder: (context, asyncSnapshot) {
                        if (asyncSnapshot.hasData) {
                          return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: asyncSnapshot.data!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Column(children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10.0, bottom: 5.0),
                                    child: Container(
                                      width: 100.0,
                                      height: 160,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          color:
                                              Colors.white10.withOpacity(0.2)),
                                      alignment: Alignment.bottomCenter,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            getTimeFromTimestamp(
                                                asyncSnapshot.data![index].dt!),
                                          ),
                                          SizedBox(
                                            height: 8.0,
                                          ),
                                          Icon(
                                            WeatherIcon.getWeatherIcon(
                                                asyncSnapshot
                                                    .data![index].condition!
                                                    .toInt()),
                                            color: kTextcolr,
                                            size: 50.0,
                                          ),
                                          SizedBox(
                                            height: 20.0,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 18.0),
                                            child: Text(
                                              '${asyncSnapshot.data![index].temp!.toInt()}°',
                                              style: TextStyle(
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ]);
                              });
                        } else if (asyncSnapshot.hasError) {
                          return Text('${asyncSnapshot.hasError}');
                        }
                        return Center(
                          child: Container(
                              height: 20,
                              width: 30,
                              child: CircularProgressIndicator()),
                        );
                      }),
                ),
              ]),
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
