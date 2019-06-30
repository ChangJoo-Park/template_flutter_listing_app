import 'package:flutter/material.dart';

class AccountState with ChangeNotifier {
  bool _loggedIn = false;

  AccountState() {
    this._loggedIn = false;
  }

  bool get loggedIn {
    return _loggedIn;
  }

  login() {
    this._loggedIn = true;
    notifyListeners();
  }

  logout() {
    this._loggedIn = false;
    notifyListeners();
  }
}
