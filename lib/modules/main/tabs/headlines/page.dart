import 'package:flutter/material.dart';
import 'package:flutter_news/language/string_manager.dart';
import 'package:flutter_news/modules/main/tabs/headlines/controller.dart';
import 'package:flutter_news/modules/main/tabs/widgets/list_news.dart';
import 'package:get/get.dart';

class HeadlinesPage extends GetView {
  final HeadlinesController controller = Get.put(HeadlinesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringManager.topNews.tr),
      ),
      body: ListNews(
          key: PageStorageKey(controller.path),
          path: controller.path,
          query: {'language': 'en'},
          keyText: controller.path),
    );
  }
}
