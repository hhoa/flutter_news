import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_news/language/localization_service.dart';
import 'package:get/get.dart';
import 'routes/app_pages.dart';

class FlutterNewsApp extends StatelessWidget {
  final Bindings initialBindings;

  FlutterNewsApp({required this.initialBindings});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppPages.pages,
      locale: LocalizationService.locale,
      fallbackLocale: LocalizationService.fallbackLocale,
      translations: LocalizationService(),
      initialBinding: initialBindings,
      defaultTransition: kIsWeb ? Transition.noTransition : Transition.native,
      initialRoute: Routes.SPLASH,
    );
  }
}
