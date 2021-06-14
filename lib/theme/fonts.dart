import 'package:flutter/material.dart';

class AssetFonts {
  static String _myFontFamily = "Roboto";

  static TextStyle medium(
      {Color color = Colors.black, double fontSize = 18, double? height}) =>
      TextStyle(
          fontFamily: _myFontFamily,
          fontWeight: FontWeight.w500,
          color: color,
          fontSize: fontSize,
          height: height);

  static TextStyle regular(
      {Color color = Colors.black, double fontSize = 18, double? height}) =>
      TextStyle(
          fontFamily: _myFontFamily,
          fontWeight: FontWeight.w400,
          color: color,
          fontSize: fontSize,
          height: height);

  static TextStyle black(
      {Color color = Colors.black, double fontSize = 18, double? height}) =>
      TextStyle(
          fontFamily: _myFontFamily,
          fontWeight: FontWeight.w900,
          color: color,
          fontSize: fontSize,
          height: height);

  static TextStyle semiBold(
      {Color color = Colors.black, double fontSize = 18, double? height}) =>
      TextStyle(
          fontFamily: _myFontFamily,
          fontWeight: FontWeight.w600,
          color: color,
          fontSize: fontSize,
          height: height);

  static TextStyle bold(
      {Color color = Colors.black, double fontSize = 18, double? height}) =>
      TextStyle(
          fontFamily: _myFontFamily,
          fontWeight: FontWeight.w700,
          color: color,
          fontSize: fontSize,
          height: height);

  static TextStyle light(
      {Color color = Colors.black, double fontSize = 18, double? height}) =>
      TextStyle(
          fontFamily: _myFontFamily,
          fontWeight: FontWeight.w300,
          color: color,
          fontSize: fontSize,
          height: height);
}