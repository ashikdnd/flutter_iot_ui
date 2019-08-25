import 'package:flutter/material.dart';

Color kPrimaryColor = Color(0xFF21D99A);
Color kAlertColor = Color(0xFFD83F52);
Color kDarkTextColor = Color(0xFF4A4A4A);
Color kLightTextColor = Color(0xFF909090);
Color kDisarmedShadowColor = Color(0xFFBAF5E0);
Color kArmedShadowColor = Color(0xFFED9AA4);
Color kBgColor = Color(0xFFFAFAFA);
Color kActiveDeviceColor = kPrimaryColor;
Color kInactiveDeviceColor = Color(0xFFA4A4A4);

var kTextSize = 12.0;
var k16TextSize = 16.0;
var kMedTextSize = 18.0;
var k20TextSize = 20.0;
var kBigTextSize = 24.0;

TextStyle kAppBarStyle = TextStyle(
  fontSize: kBigTextSize,
  fontWeight: FontWeight.bold,
);

TextStyle kNotificationBarTextStyle = TextStyle(
  fontSize: kMedTextSize,
  fontWeight: FontWeight.bold,
  color: Colors.white
);

TextStyle kNotificationBarIconStyle = TextStyle(
  fontSize: kTextSize,
);

TextStyle kMeasureTextStyle = TextStyle(
  fontSize: k20TextSize,
);

TextStyle kUnitsTextStyle = TextStyle(
  fontSize: kTextSize,
  color: Colors.white
);

TextStyle kMedTextStyle = TextStyle(
    fontSize: kMedTextSize,
);

TextStyle kBigTextStyle = TextStyle(
    fontSize: kBigTextSize,
);

TextStyle kActivityInfoTextStyle = TextStyle(
    fontSize: kTextSize,
    color: Colors.grey[350],
    fontWeight: FontWeight.bold
);

TextStyle deviceNameTextStyle = TextStyle(
    fontSize: k16TextSize,
);