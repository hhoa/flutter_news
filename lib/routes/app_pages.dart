import 'package:flutter_news/modules/splash/controller.dart';
import 'package:flutter_news/modules/splash/page.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.SPLASH,
      transition: Transition.fadeIn,
      page: () => SplashPage(),
      bindings: [
        BindingsBuilder(() => Get.put<SplashController>(SplashController())),
      ],
    ),
  ];
}
