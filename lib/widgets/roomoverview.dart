import 'package:flutter/material.dart';
import 'package:iot/constants.dart';
import 'package:iot/providers/security.dart';
import 'package:provider/provider.dart';

class RoomOverview extends StatefulWidget {

  RoomOverview({
    @required this.temperature,
    @required this.power,
    @required this.humidity,
    @required this.roomName,
    @required this.roomImg,
    @required this.lastActivity,
    @required this.locked,
    @required this.opacity,
  });

  final int temperature;
  final int power;
  final int humidity;
  final String roomName;
  final String roomImg;
  final String lastActivity;
  final double opacity;
  bool locked;

  @override
  _RoomOverviewState createState() => _RoomOverviewState();
}

class _RoomOverviewState extends State<RoomOverview> {

  @override
  Widget build(BuildContext context) {
    final security = Provider.of<Security>(context);

    return Container(
      margin: EdgeInsets.only(top: 8.0, bottom: 20.0),
      padding: EdgeInsets.only(left: 20.0, top: 25.0, right: 20.0, bottom: 5.0),
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
          image: AssetImage('images/${widget.roomImg}'),
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(widget.opacity),
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
                        'images/thermometer.png',
                      ),
                      width: 20.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          "${widget.temperature} ",
                          style: kMeasureTextStyle.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "º ",
                          style: kUnitsTextStyle.copyWith(
                            color: Colors.white,
                            letterSpacing: -1.0,
                          ),
                        ),Text(
                          "c",
                          style: kMeasureTextStyle.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
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
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          "${widget.power} ",
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
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          "${widget.humidity} ",
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
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "${widget.roomName}",
                      style: kBigTextStyle.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      "Last activity ${widget.lastActivity} ago",
                      style: kActivityInfoTextStyle,
                    )
                  ],
                ),
              ),
              Icon(
                Icons.settings,
                color: Colors.white,
                size: 22.0,
              ),
            ],
          )
        ],
      ),
    );
  }
}

