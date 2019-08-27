import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'constants.dart';

class SmartHome extends StatefulWidget {
  @override
  _SmartHomeState createState() => _SmartHomeState();
}

class _SmartHomeState extends State<SmartHome>
    with SingleTickerProviderStateMixin {
  String securityStatusText;
  Color securityStatusColor;
  double securityStatusBorderRadius;
  Color securityStatusShadowColor;
  IconData securityIcon;

  AnimationController controller;
  Animation<Offset> offset;

  Timer _timer;
  int _securityCountdown;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    offset = Tween<Offset>(begin: Offset(-5.0, 0.0), end: Offset(0.0, 0.0))
        .animate(controller);

    disableSecurity();
    _securityCountdown = kSecurityTimeout;

  }

  void enableSecurity() {
    setState(() {
      securityIcon = Icons.lock_outline;
      securityStatusColor = kAlertColor;
      securityStatusText = "Security system armed";
      securityStatusBorderRadius = 15.0;
      securityStatusShadowColor = kArmedShadowColor;
    });
  }

  void triggerSecurityTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
        (Timer timer) => setState(
          () {
          if (_securityCountdown < 1) {
            timer.cancel();
            toggleAnimation('hide');
            enableSecurity();
            _securityCountdown = kSecurityTimeout;
          } else {
            _securityCountdown = _securityCountdown - 1;
          }
        },
      ),
    );
  }

  void disableSecurity() {
    setState(() {
      securityIcon = Icons.lock_open;
      securityStatusText = "Security system disarmed";
      securityStatusColor = kPrimaryColor;
      securityStatusBorderRadius = 3.0;
      securityStatusShadowColor = kDisarmedShadowColor;
    });
  }

  void toggleAnimation(type) {
    if(controller.status == AnimationStatus.dismissed && type == 'show') {
      controller.forward();
      triggerSecurityTimer();
    }

    if(controller.status == AnimationStatus.completed && type == 'hide') {
      disableSecurity();
      _timer.cancel();
      _securityCountdown = kSecurityTimeout;
      controller.reverse();
    }
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
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      toggleAnimation('show');
                    },
                    child: AnimatedContainer(
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
                        borderRadius:
                            BorderRadius.circular(securityStatusBorderRadius),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            securityIcon,
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
                  ),
                  // Room Block
                  Column(
                    children: <Widget>[
                      // Room Overview
                      Container(
                        margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                        padding: EdgeInsets.only(
                            left: 20.0, top: 35.0, right: 20.0, bottom: 5.0),
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
                                        image: AssetImage(
                                            'images/thermometer.png'),
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
                                        image:
                                            AssetImage('images/humidity.png'),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                border: Border.all(
                                    width: 1.0, color: Colors.grey[300]),
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
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  "Off",
                                  style: deviceNameTextStyle,
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.28,
                            margin: EdgeInsets.all(4.0),
                            padding: EdgeInsets.only(
                              top: 12.0,
                              bottom: 12.0,
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1.0, color: Colors.grey[300]),
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.white),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RotatedBox(
                                  quarterTurns: 0,
                                  child: SvgPicture.asset(
                                    'images/air-con.svg',
                                    semanticsLabel: 'Air Conditioner',
                                    height: 32.0,
                                    color: Color(0xFFA4A4A4),
                                  ),
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                Text(
                                  "Air Con.",
                                  style: deviceNameTextStyle,
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  "Off",
                                  style: deviceNameTextStyle,
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.28,
                            margin: EdgeInsets.all(4.0),
                            padding: EdgeInsets.only(
                              top: 12.0,
                              bottom: 12.0,
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1.0, color: Colors.grey[300]),
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.white),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RotatedBox(
                                  quarterTurns: 0,
                                  child: SvgPicture.asset(
                                    'images/webcam.svg',
                                    semanticsLabel: 'Camera',
                                    height: 32.0,
                                    color: Color(0xFFA4A4A4),
                                  ),
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                Text(
                                  "Camera",
                                  style: deviceNameTextStyle,
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  "Off",
                                  style: deviceNameTextStyle,
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.28,
                            margin: EdgeInsets.all(4.0),
                            padding: EdgeInsets.only(
                              top: 12.0,
                              bottom: 12.0,
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1.0, color: Colors.grey[300]),
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.white),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RotatedBox(
                                  quarterTurns: 0,
                                  child: SvgPicture.asset(
                                    'images/television.svg',
                                    semanticsLabel: 'TV',
                                    height: 32.0,
                                    color: Color(0xFFA4A4A4),
                                  ),
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                Text(
                                  "TV",
                                  style: deviceNameTextStyle,
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  "Off",
                                  style: deviceNameTextStyle,
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.28,
                            margin: EdgeInsets.all(4.0),
                            padding: EdgeInsets.only(
                              top: 12.0,
                              bottom: 12.0,
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1.0, color: Colors.grey[300]),
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.white),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RotatedBox(
                                  quarterTurns: 0,
                                  child: SvgPicture.asset(
                                    'images/window.svg',
                                    semanticsLabel: 'Window',
                                    height: 32.0,
                                    color: Color(0xFFA4A4A4),
                                  ),
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                Text(
                                  "Window",
                                  style: deviceNameTextStyle,
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  "Off",
                                  style: deviceNameTextStyle,
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.28,
                            margin: EdgeInsets.all(4.0),
                            padding: EdgeInsets.only(
                              top: 12.0,
                              bottom: 12.0,
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1.0, color: Colors.grey[300]),
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.white),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RotatedBox(
                                  quarterTurns: 0,
                                  child: SvgPicture.asset(
                                    'images/speaker.svg',
                                    semanticsLabel: 'Speaker',
                                    height: 32.0,
                                    color: Color(0xFFA4A4A4),
                                  ),
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                Text(
                                  "Speakers",
                                  style: deviceNameTextStyle,
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  "Off",
                                  style: deviceNameTextStyle,
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
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.1 - 15.0,
                ),
                child: SlideTransition(
                  position: offset,
                  child: Container(
                    margin: EdgeInsets.only(top: 30.0),
                    padding: EdgeInsets.only(
                      top: 35.0,
                      bottom: 35.0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black54,
                          offset: Offset(
                            0.0,
                            2.5,
                          ),
                          blurRadius: 5.0,
                          spreadRadius: 1.0,
                        )
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SvgPicture.asset(
                          'images/protection.svg',
                          color: kAlertColor,
                          width: 48.0,
                        ),
                        SizedBox(height: 15.0),
                        Text("Arming", style: kAlertTextStyle),
                        SizedBox(height: 15.0),
                        Text(
                          "Please leave your ",
                          style: TextStyle(
                            fontSize: 22.0,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          "apartment. Activating in...",
                          style: TextStyle(
                            fontSize: 22.0,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 15.0),
                        Text(
                          _securityCountdown.toString(),
                          style: kBigTextStyle.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 42.0,
                            color: Colors.grey,
                          ),
                          textAlign: TextAlign.end,
                        ),
                        Text(
                          "Seconds",
                          style: kActivityInfoTextStyle,
                        ),
                        SizedBox(height: 15.0),
                        OutlineButton(
                          onPressed: () {
                            toggleAnimation('hide');
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Text("Cancel"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
