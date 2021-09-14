import 'package:flutter/material.dart';
import 'package:weather_app/colors%20and%20theme/colors.dart';

class CityHeader extends StatelessWidget {
  const CityHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.transparent,
      title: Text(
        'San Francisco',
        style: TextStyle(
            fontWeight: FontWeight.w500, fontSize: 20.0, color: kTextcolr),
      ),
      trailing: IconButton(
        icon: Icon(
          Icons.location_on,
        ),
        onPressed: () {},
      ),
    );
  }
}
