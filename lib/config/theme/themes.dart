import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

final light = ThemeData.light();
final dark = ThemeData.dark();

AppTheme firstCustomTheme() {
  return AppTheme(
    id: "first_custom_theme",
    description: "First Custom Color Scheme",
    data: ThemeData(
      accentColor: Colors.yellow,
      primaryColor: Colors.red,
      scaffoldBackgroundColor: Colors.yellow[200],
      buttonColor: Colors.amber,
      dialogBackgroundColor: Colors.yellow,
    ),
  );
}

AppTheme secondCustomTheme() {
  return AppTheme(
    id: "second_custom_theme",
    description: "Second Custom Color Scheme",
    data: dark.copyWith(
      primaryColor: Colors.blue,
      accentColor: Colors.amberAccent,
      accentIconTheme: dark.iconTheme.copyWith(color: Colors.black),
      dialogTheme: const DialogTheme(
          shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
      )),
    ),
  );
}
