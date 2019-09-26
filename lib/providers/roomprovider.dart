import 'package:flutter/material.dart';
import 'package:iot/model/rooms.dart';

class RoomProvider extends ChangeNotifier {

  static List _roomList = rooms;

  getRooms() => _roomList;

  updateRoomDeviceStatus(int roomIndex, int deviceIndex) {
    _roomList[roomIndex]['devices'][deviceIndex]['status'] = !_roomList[roomIndex]['devices'][deviceIndex]['status'];
    notifyListeners();
  }

  lockRooms() {
    for(int i=0; i<_roomList.length; i++) {
      _roomList[i]['locked'] = true;
    }
    notifyListeners();
  }

  unlockRooms() {
    for(int i=0; i<_roomList.length; i++) {
      _roomList[i]['locked'] = false;
    }
    notifyListeners();
  }
}