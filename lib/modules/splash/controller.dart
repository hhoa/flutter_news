import 'package:flutter_news/biz/constants.dart';
import 'package:flutter_news/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    super.onInit();

    String? username = GetStorage().read(Constants.USERNAME_KEY);
    await Future.delayed(1.seconds);
    Get.offNamed(username == null ? Routes.AUTHENTICATION : Routes.MAIN);
  }
}
