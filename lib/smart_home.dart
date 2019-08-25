import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'constants.dart';

class SmartHome extends StatefulWidget {
  @override
  _SmartHomeState createState() => _SmartHomeState();
}

class _SmartHomeState extends State<SmartHome> {
  String securityStatusText;
  Color securityStatusColor;
  double securityStatusBorderRadius;
  Color securityStatusShadowColor;

  void initState() {
    super.initState();
    securityStatusText = "Security system disarmed";
    securityStatusColor = kPrimaryColor;
    securityStatusBorderRadius = 3.0;
    securityStatusShadowColor = kDisarmedShadowColor;
  }

  void enableSecurity() {
    setState(() {
      securityStatusColor = kAlertColor;
      securityStatusText = "Security system armed";
      securityStatusBorderRadius = 15.0;
      securityStatusShadowColor = kArmedShadowColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        textTheme: TextTheme(
          body1: TextStyle(
            color: kLightTextColor,
            fontWeight: FontWeight.bold,
            fontSize: kMedTextSize,
          ),
        ),
        iconTheme: IconThemeData(
          color: kLightTextColor,
        ),
        backgroundColor: kBgColor,
        elevation: 0,
        leading: Icon(Icons.menu),
        title: RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: "Smart  ",
                style: kAppBarStyle.copyWith(color: kPrimaryColor),
              ),
              TextSpan(
                  text: "Home",
                  style: kAppBarStyle.copyWith(color: kDarkTextColor))
            ],
          ),
        ),
        actions: <Widget>[
          Row(
            children: <Widget>[
              Text("3"),
              SizedBox(
                width: 5.0,
              ),
              Icon(Icons.notifications),
            ],
          ),
          SizedBox(
            width: 15.0,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              AnimatedContainer(
                padding: EdgeInsets.only(
                  top: 12.0,
                  bottom: 12.0,
                ),
                duration: Duration(milliseconds: 800),
                curve: Curves.fastOutSlowIn,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: securityStatusShadowColor,
                      offset: Offset(
                        0.0,
                        2.5,
                      ),
                      blurRadius: 5.0,
                      spreadRadius: 1.0,
                    )
                  ],
                  color: securityStatusColor,
                  borderRadius: BorderRadius.circular(securityStatusBorderRadius),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.lock_outline,
                      color: Colors.white,
                      size: kBigTextSize,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      securityStatusText,
                      style: kNotificationBarTextStyle,
                    ),
                  ],
                ),
              ),
              // Room Block
              Column(
                children: <Widget>[
                  // Room Overview
                  Container(
                    margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                    padding: EdgeInsets.only(
                        left: 20.0, top: 35.0, right: 20.0, bottom: 15.0),
                    width: double.infinity,
                    height: 180.0,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(
                            0.0,
                            1.0,
                          ),
                          blurRadius: 4.0,
                          spreadRadius: 0.5,
                        )
                      ],
                      borderRadius: BorderRadius.circular(15.0),
                      image: DecorationImage(
                        image: AssetImage('images/living-room.jpg'),
                        colorFilter: new ColorFilter.mode(
                          Colors.black.withOpacity(0.9),
                          BlendMode.dstATop,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        // Measures and units
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                textBaseline: TextBaseline.alphabetic,
                                children: <Widget>[
                                  Image(
                                    image: AssetImage('images/thermometer.png'),
                                    width: 20.0,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.baseline,
                                    textBaseline: TextBaseline.alphabetic,
                                    children: <Widget>[
                                      Text(
                                        "26 ",
                                        style: kMeasureTextStyle.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        "ºc",
                                        style: kMeasureTextStyle.copyWith(
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                textBaseline: TextBaseline.alphabetic,
                                children: <Widget>[
                                  Image(
                                    image: AssetImage('images/plug.png'),
                                    width: 20.0,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.baseline,
                                    textBaseline: TextBaseline.alphabetic,
                                    children: <Widget>[
                                      Text(
                                        "54 ",
                                        style: kMeasureTextStyle.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        "kWh",
                                        style: kUnitsTextStyle.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                textBaseline: TextBaseline.alphabetic,
                                children: <Widget>[
                                  Image(
                                    image: AssetImage('images/humidity.png'),
                                    width: 20.0,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.baseline,
                                    textBaseline: TextBaseline.alphabetic,
                                    children: <Widget>[
                                      Text(
                                        "61 ",
                                        style: kMeasureTextStyle.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        "%",
                                        style: kUnitsTextStyle.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        // Room info and last activity details
                        SizedBox(
                          height: 50.0,
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Living Room",
                                    style: kBigTextStyle.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  Text(
                                    "Last activity 14 min ago",
                                    style: kActivityInfoTextStyle,
                                  )
                                ],
                              ),
                            ),
                            Icon(
                              Icons.settings,
                              color: Colors.white,
                              size: 30.0,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  // Room settings
                  Wrap(
                    alignment: WrapAlignment.center,
                    direction: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.28,
                        margin: EdgeInsets.all(4.0),
                        padding: EdgeInsets.only(
                          top: 12.0,
                          bottom: 12.0,
                        ),
                        decoration: BoxDecoration(
                            border:
                            Border.all(width: 1.0, color: Colors.grey[300]),
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RotatedBox(
                              quarterTurns: 2,
                              child: SvgPicture.asset(
                                'images/light-bulb.svg',
                                semanticsLabel: 'Light Bulb',
                                height: 32.0,
                                color: Color(0xFFA4A4A4),
                              ),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Text(
                              "Lights",
                              style: deviceNameTextStyle.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: kInactiveDeviceColor
                              ),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              "Off",
                              style: deviceNameTextStyle.copyWith(
                                color: kInactiveDeviceColor,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
