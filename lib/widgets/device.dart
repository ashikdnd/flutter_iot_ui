import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iot/constants.dart';

class Device extends StatefulWidget {

  Device(
      {@required this.icon,
        @required this.label,
        @required this.color,
        @required this.status,
        this.rotationValue});

  final String icon;
  final String label;
  Color color;
  final bool status;
  final int rotationValue;

  @override
  _DeviceState createState() => _DeviceState();
}

class _DeviceState extends State<Device> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4.0),
      padding: EdgeInsets.only(
        top: 12.0,
      ),
      height: 70.0,
      decoration: BoxDecoration(
        border: Border.all(width: 1.0, color: Colors.grey[300]),
        borderRadius: BorderRadius.circular(10.0),
        //color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
              child: Column(
                children: <Widget>[
                  RotatedBox(
                    quarterTurns: widget.rotationValue ?? 0,
                    child: SvgPicture.asset(
                      'images/${widget.icon}',
                      height: 32.0,
                      color: widget.color,
                    ),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Text(
                    widget.label,
                    style: kDeviceNameTextStyle.copyWith(
                      fontWeight: FontWeight.bold,
                      color: widget.color,
                    ),
                  ),
                  SizedBox(
                    height: 3.0,
                  ),
                  Text(
                    widget.status == true ? 'On' : 'Off',
                    style: kDeviceNameTextStyle.copyWith(
                      color: widget.color,
                    ),
                  )
                ],
              ),
            ),
          ),

          widget.status == true ? FractionallySizedBox(
            widthFactor: 0.6,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.1,
              height: 4.0,
              decoration: BoxDecoration(
                color: kActiveDeviceColor,
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ) : SizedBox(),
        ],
      ),
    );
  }

}