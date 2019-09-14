import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iot/constants.dart';

class Device extends StatelessWidget {
  Device(
      {@required this.icon,
      @required this.label,
      @required this.color,
      @required this.statusText,
      this.rotationValue});

  final String icon;
  final String label;
  final Color color;
  final String statusText;
  final int rotationValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.28,
      margin: EdgeInsets.all(4.0),
      padding: EdgeInsets.only(
        top: 12.0,
        bottom: 12.0,
      ),
      decoration: BoxDecoration(
          border: Border.all(width: 1.0, color: Colors.grey[300]),
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RotatedBox(
            quarterTurns: rotationValue ?? 0,
            child: SvgPicture.asset(
              'images/$icon',
              height: 32.0,
              color: color,
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(
            label,
            style: kDeviceNameTextStyle.copyWith(
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            statusText,
            style: kDeviceNameTextStyle.copyWith(
              color: color,
            ),
          )
        ],
      ),
    );
  }
}
