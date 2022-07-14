import 'package:flutter/material.dart';

const Color kColor = Color(0xffFD794F);

class Themes{
  static final light = ThemeData(
    backgroundColor: kColor,
    primaryColor: kColor,
    brightness: Brightness.light,
  );

  static final dark = ThemeData(
    backgroundColor: Colors.black,
    primaryColor: Colors.grey,
    brightness: Brightness.dark
  );
}