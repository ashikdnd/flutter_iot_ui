import 'package:iot/widgets/roomoverview.dart';

var rooms = [
  RoomOverview(
    temperature: 24,
    power: 60,
    humidity: 73,
    roomName: 'Living Room',
    roomImg: 'living-room.jpg',
    lastActivity: '15 min',
    locked: false,
    opacity: 0.9
  ),
  RoomOverview(
    temperature: 21,
    power: 64,
    humidity: 58,
    roomName: 'Bed Room',
    roomImg: 'bed-room.jpg',
    lastActivity: '6 min',
    locked: false,
    opacity: 0.90,
  ),
];
