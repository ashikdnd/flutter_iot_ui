import 'package:flutter/material.dart';
import 'smart_home.dart';
import 'constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        accentColor: Color(0xFF21D99A),
        textTheme: TextTheme(
          headline:  TextStyle(fontSize: 12.0, color: kDarkTextColor),
          title:  TextStyle(fontSize: 24.0, color: kDarkTextColor),
          body1: TextStyle(fontSize: 12.0, color: kDarkTextColor),
        ),
      ),
      home: SmartHome(),
    );
  }
}
