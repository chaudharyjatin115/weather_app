import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/colors%20and%20theme/colors.dart';

class BottomWeatherWidget extends StatelessWidget {
  const BottomWeatherWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 120.0),
      child: Container(
        width: 120.0,
        height: 180,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.white10.withOpacity(0.2)),
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(alignment: Alignment.center),
            Text(
              '9 AM',
            ),
            SizedBox(
              height: 10.0,
            ),
            Icon(
              CupertinoIcons.sun_max,
              color: kTextcolr,
              size: 80.0,
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Text(
                '30 °',
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ignore: camel_case_types