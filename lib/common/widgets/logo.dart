import 'package:flutter/material.dart';
import 'package:flutter_news/theme/fonts.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "FlutterNews",
      style: AssetFonts.medium(fontSize: 30).copyWith(letterSpacing: 2),
    );
  }
}
