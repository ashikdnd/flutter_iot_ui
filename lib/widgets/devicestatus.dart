import 'package:flutter/material.dart';
import'package:flutter_svg/flutter_svg.dart';

class DeviceStatuses extends StatelessWidget {

  DeviceStatuses({@required this.deviceStatusHeight});

  final double deviceStatusHeight;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: deviceStatusHeight,
      decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
                color: Colors.grey[300],
                width: 1.0,
                style: BorderStyle.solid),
          )),
      duration: Duration(milliseconds: 800),
      curve: Curves.fastOutSlowIn,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SvgPicture.asset(
                    'images/cloud_connection.svg',
                    height: 20.0,
                    color: Colors.grey[700],
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                    child: Text("Cloud server connection"),
                  ),
                  Text("45 Mb/s")
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SvgPicture.asset(
                    'images/battery_level.svg',
                    height: 20.0,
                    color: Colors.grey[700],
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                    child: Text("Backup battery level"),
                  ),
                  Text("97%")
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SvgPicture.asset(
                    'images/sensor.svg',
                    height: 20.0,
                    color: Colors.grey[700],
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                    child: Text("Active sensors"),
                  ),
                  Text("17 / 17")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}