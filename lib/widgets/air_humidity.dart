import 'package:flutter/material.dart';

class AirHumidity extends StatelessWidget {
  const AirHumidity({
    Key? key,
  }) : super(key: key);

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
            '8 km/h',
            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            width: 20.0,
          ),
          Icon(
            Icons.water,
            size: 20.0,
          ),
          SizedBox(
            width: 20.0,
          ),
          Text(
            '47 %',
            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
