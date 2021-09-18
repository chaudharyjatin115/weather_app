import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          Icon(
            Icons.air,
            size: 20.0,
          ),
          SizedBox(width: 15.0),
          Text(
            '$speed km/h',
            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            width: 20.0,
          ),
          Icon(
            CupertinoIcons.drop,
            size: 20.0,
          ),
          SizedBox(
            width: 20.0,
          ),
          Text(
            '$humid %',
            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
