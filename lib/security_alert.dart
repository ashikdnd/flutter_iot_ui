import 'package:flutter/material.dart';

class SecurityAlert extends StatefulWidget {

  SecurityAlert({@required this.visibility});

  final bool visibility;

  @override
  _SecurityAlertState createState() => _SecurityAlertState();
}

class _SecurityAlertState extends State<SecurityAlert> {

  @override
  Widget build(BuildContext context) {

    return AnimatedOpacity(
      // If the widget is visible, animate to 0.0 (invisible).
      // If the widget is hidden, animate to 1.0 (fully visible).
      opacity: widget.visibility ? 1.0 : 0.0,
      duration: Duration(milliseconds: 500),
      // The green box must be a child of the AnimatedOpacity widget.
      child: Container(
        width: 200.0,
        height: 200.0,
        color: Colors.green,
      ),
    );
  }
}
