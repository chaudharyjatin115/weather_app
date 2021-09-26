import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/Screens.dart/loading.dart';
import 'package:weather_app/Screens.dart/weatherScreen.dart';

import 'colors and theme/colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarIconBrightness: Brightness.dark,
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarIconBrightness:
        Brightness.dark, // transparent status bar
  ));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          iconTheme: IconThemeData(color: kTextcolr),
          textTheme: TextTheme(bodyText2: TextStyle(color: kTextcolr)),
          appBarTheme: AppBarTheme(elevation: 0, color: Colors.transparent)),
      debugShowCheckedModeBanner: false,
      home: LoadingScreen(),
    );
  }
}
