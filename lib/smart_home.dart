import 'package:flutter/material.dart';
import 'constants.dart';

class SmartHome extends StatefulWidget {
  @override
  _SmartHomeState createState() => _SmartHomeState();
}

class _SmartHomeState extends State<SmartHome> {
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
        backgroundColor: Colors.white,
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
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            AnimatedContainer(
              padding: EdgeInsets.only(
                top: 12.0,
                bottom: 12.0,
              ),
              duration: Duration(milliseconds: 500),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: kDisarmedShadowColor,
                      offset: Offset(
                        0.0,
                        2.0,
                      ),
                      blurRadius: 8.0,
                      spreadRadius: 2.0,
                    )
                  ],
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(15.0)),
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
                    "Security system disarmed",
                    style: kNotificationBarTextStyle,
                  ),
                ],
              ),
            ),
            // Room Block
            Container(
              margin: EdgeInsets.only(top: 20.0),
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
                      Colors.black.withOpacity(0.95), BlendMode.dstATop),
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Image(
                              image: AssetImage('images/thermometer.png'),
                              width: 20.0,
                            ),
                            Text(
                              "26",
                              style: kMeasureTextStyle.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "ºc",
                              style: kUnitsTextStyle.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Image(
                              image: AssetImage('images/plug.png'),
                              width: 20.0,
                            ),
                            Text(
                              "54",
                              style: kMeasureTextStyle.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              " kWh",
                              style: kUnitsTextStyle.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Image(
                              image: AssetImage('images/humidity.png'),
                              width: 20.0,
                            ),
                            Text(
                              "61",
                              style: kMeasureTextStyle.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "%",
                              style: kUnitsTextStyle.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
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
                              ),
                            ),
                            SizedBox(height: 8.0,),
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
            )
          ],
        ),
      ),
    );
  }
}
