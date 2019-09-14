import 'package:flutter/material.dart';

class Security extends ChangeNotifier {
  bool _status;

  Security(this._status);

  getStatus() => _status;

  setStatus(bool status) => _status = status;

  void updateStatus(status) {
    _status = status;
    notifyListeners();
  }
}