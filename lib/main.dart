import 'package:flutter/material.dart';
import 'package:flutter_news/service/api_connector.dart';
import 'package:flutter_news/service/api_service.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:flutter_news/env/production_env.dart';
import 'package:flutter_news/env/base.dart';

import 'app.dart';

void main() async {
  await GetStorage.init();
  var env = ProductionEnviroment();
  print('Started: ${env.description}');

  final initialBindings = BindingsBuilder(() {
    Get.put<IEnviroment>(env, permanent: true);
    Get.put<GetConnect>(ApiConnector(Get.find()), permanent: true);
    Get.put<IApiService>(ApiService(connector: Get.find()), permanent: true);
  });
  runApp(FlutterNewsApp(initialBindings: initialBindings));
}