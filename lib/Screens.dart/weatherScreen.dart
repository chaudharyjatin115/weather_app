import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/colors%20and%20theme/colors.dart';
import 'package:weather_app/utils/weather_data_location.dart';
import 'package:weather_app/widgets/bottomweatherwidget.dart';
import 'package:weather_app/widgets/main_weather.dart';

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String? cityname;
  String? weatherMessage;
  double? temperature;
  IconData? weatherIcon;
  int? condition;
  int? humidity;
  double? windSpeed;

  @override
  void initState() {
    super.initState();
    getWeather();
  }

  dynamic getWeather() async {
    var weather = await WeatherData().getLocationWeather();
    setState(() {
      if (weather == null) {
        temperature = 0;
        weatherIcon = CupertinoIcons.sun_haze;
        weatherMessage = 'Unable to get weather data';
        cityname = 'Lucknow';
        condition = 400;
        humidity = 400;
        windSpeed = 1.5;
      } else {
        temperature = weather['main']['temp'];

        condition = weather['weather'][0]['id'];
        weatherIcon = WeatherData().getWeatherIcon(condition!);
        cityname = weather['name'];
        weatherMessage = WeatherData().getMessage(condition!);
        humidity = weather['main']['humidity'];
        windSpeed = weather['wind']['speed'];
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: WeatherData().getBgColor(temperature!.toInt()))),
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
              onPressed: () {},
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
                temp: temperature!.toInt(),
                humidity: humidity,
                speed: windSpeed,
              ),
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
