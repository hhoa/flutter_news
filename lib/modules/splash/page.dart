import 'package:flutter/material.dart';
import 'package:flutter_news/common/widgets/logo.dart';
import 'package:get/get.dart';

class SplashPage extends GetView<GetxController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AppLogo(),
      ),
    );
  }
}
