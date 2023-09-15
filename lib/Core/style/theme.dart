import 'package:flutter/material.dart';


class MyTheme{
  static final lightTheme = ThemeData(

    primarySwatch: Colors.green,
    primaryColor: const Color(0xff39A552),
    textTheme: const TextTheme(
        // titleMedium:
      headline6: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.w500))
  );
}