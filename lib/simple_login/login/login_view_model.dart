import 'package:flutter/material.dart';

class LoginInfo extends ChangeNotifier {
  var _userName = '';
  var _isLoggedIn = false;

  String get userName => _userName;
  bool get isLoggedIn => _isLoggedIn;

  void onUserNameChanged(String value) {
    _userName = value;
    // notifyListeners();
  }

  void login() {
    // _userName = userName;
    if (_userName.isNotEmpty) {
      _isLoggedIn = true;
      notifyListeners();
    }
  }

  void logout() {
    _userName = '';
    _isLoggedIn = false;
    notifyListeners();
  }
}
