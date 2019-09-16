import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iot/providers/roomprovider.dart';
import 'package:iot/widgets/roomoverview.dart';
import 'package:provider/provider.dart';
import 'package:iot/providers/security.dart';
import 'dart:async';

import 'package:iot/widgets/devicestatus.dart';
import 'package:iot/model/rooms.dart';
import 'constants.dart';

class SmartHome extends StatefulWidget {
  @override
  _SmartHomeState createState() => _SmartHomeState();
}

class _SmartHomeState extends State<SmartHome>
    with SingleTickerProviderStateMixin {


  String securityStatusText = kSecurityArmedStatusText;
  Color securityStatusColor = kPrimaryColor;
  double securityStatusBorderRadius = 3.0;
  Color securityStatusShadowColor = kDisarmedShadowColor;
  IconData securityIcon = Icons.lock_open;
  double deviceStatusHeight = 0;

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

    _securityCountdown = kSecurityTimeout;
  }

  void triggerSecurityTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_securityCountdown == 1) {
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

  void enableSecurity() {
    setState(() {
      securityIcon = Icons.lock_outline;
      securityStatusColor = kAlertColor;
      securityStatusText = kSecurityArmedStatusText;
      securityStatusBorderRadius = 15.0;
      securityStatusShadowColor = kArmedShadowColor;
    });
    Provider.of<Security>(context).updateStatus(true);
  }

  void disableSecurity() {
    setState(() {
      securityIcon = Icons.lock_open;
      securityStatusText = kSecurityDisarmedStatusText;
      securityStatusColor = kPrimaryColor;
      securityStatusBorderRadius = 3.0;
      securityStatusShadowColor = kDisarmedShadowColor;
    });
    Provider.of<Security>(context).updateStatus(false);
  }

  bool toggleAnimation(type) {
    var sec = Provider.of<Security>(context);
    if (type == 'show') {
      if (sec.getStatus() == true) {
        disableSecurity();
        return false;
      }
      if (controller.status == AnimationStatus.dismissed &&
          sec.getStatus() == false) {
        controller.forward();
        triggerSecurityTimer();
      }
    }

    if (controller.status == AnimationStatus.completed && type == 'hide') {
      disableSecurity();
      _timer.cancel();
      _securityCountdown = kSecurityTimeout;
      controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {

    final security = Provider.of<Security>(context);
    final roomProvider = Provider.of<RoomProvider>(context);
    List roomList = roomProvider.getRooms();

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
        title: Center(
          child: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: "Smart  ",
                  style: kAppBarStyle.copyWith(color: kPrimaryColor),
                ),
                TextSpan(
                    text: "Home",
                    style: kAppBarStyle.copyWith(
                        color: kDarkTextColor, fontWeight: FontWeight.normal))
              ],
            ),
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
                  // Security
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
                  // Devices status
                  DeviceStatuses(),
                  SizedBox(height: 10.0,),
                  // Rooms
                  ListView.builder(
                    itemCount: roomList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, i) {
                      return Column(
                        children: <Widget>[
                        // Room Overview. Load rooms list from provider
                        RoomOverview(
                          temperature: roomList[i]['temperature'],
                          power: roomList[i]['power'],
                          humidity: roomList[i]['humidity'],
                          roomName: roomList[i]['roomName'],
                          roomImg: roomList[i]['roomImg'],
                          lastActivity: roomList[i]['lastActivity'],
                          locked: roomList[i]['locked'],
                          opacity: roomList[i]['opacity'],
                          devices: roomList[i]['devices'],
                          roomIndex: i,
                        ),
                        i < rooms.length - 1 ? Divider() : SizedBox(),
                        ],
                      );
                    },
                  ),
                ],
              ),
              // Lockdown Timer
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
