import 'package:flutter_news/modules/authentication/controller.dart';
import 'package:flutter_news/modules/authentication/page.dart';
import 'package:flutter_news/modules/main/controller.dart';
import 'package:flutter_news/modules/main/page.dart';
import 'package:flutter_news/modules/main/repository.dart';
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
    GetPage(
      name: Routes.AUTHENTICATION,
      transition: Transition.fadeIn,
      page: () => AuthenticationPage(),
      bindings: [
        BindingsBuilder(() =>
            Get.put<AuthenticationController>(AuthenticationController())),
      ],
    ),
    GetPage(
      name: Routes.MAIN,
      transition: Transition.fadeIn,
      page: () => MainPage(),
      bindings: [
        BindingsBuilder(() => Get.lazyPut<IMainRepository>(
                () => MainRepository(apiService: Get.find()))),
        BindingsBuilder(() =>
            Get.put<MainController>(MainController())),
      ],
    ),
  ];
}
