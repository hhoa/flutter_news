import 'package:flutter_news/env/base.dart';
import 'package:get/get.dart';

class ApiConnector extends GetConnect {
  final IEnviroment env;
  ApiConnector(this.env);

  @override
  void onInit() {
    super.onInit();
    if (env.domain.isNotEmpty == true) {
      httpClient.baseUrl = Uri.https(env.domain, env.subPath).toString();
      httpClient.defaultContentType = 'application/json';
    }
  }
}
