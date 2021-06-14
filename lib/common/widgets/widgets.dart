import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget buildHeight(double height) {
  return SizedBox(
    height: height,
  );
}

Widget buildWidth(double width) {
  return SizedBox(
    width: width,
  );
}

List<BoxShadow> commonShadow = [
  BoxShadow(
    color: Colors.black45,
    offset: Offset(0, 4),
    blurRadius: 4,
  ),
];

Widget buildLineSeparated(
    {Color? lineColor, EdgeInsets? margin, bool isShadow = false, double height = 1}) {
  return Container(
    margin: margin ?? const EdgeInsets.only(top: 16, bottom: 20),
    height: height,
    width: Get.width,
    decoration: BoxDecoration(
      color: lineColor ?? Colors.black,
      boxShadow: isShadow ? commonShadow : null,
    ),
  );
}