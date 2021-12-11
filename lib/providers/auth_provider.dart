import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool authenticated = false;

  void login() {
    print("Login");
    if (authenticated == false) {
      authenticated = true;
      notifyListeners();
    }
  }

  void logout() {
    print("Logout");
    if (authenticated == true) {
      authenticated = false;
      notifyListeners();
    }
  }
}
