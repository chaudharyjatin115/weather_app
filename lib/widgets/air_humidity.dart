import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:weather_icons/weather_icons.dart';

class AirHumidity extends StatelessWidget {
  final int? humid;
  final double? speed;
  const AirHumidity({required this.humid, required this.speed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(
                WeatherIcons.wind,
                size: 15.0,
              ),
              SizedBox(width: 20.0),
              Padding(
                padding: const EdgeInsets.only(top: 9.0),
                child: Text(
                  '$speed km/h',
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                WeatherIcons.humidity,
                size: 15.0,
              ),
              SizedBox(
                width: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 9.0),
                child: Text(
                  '$humid %',
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
