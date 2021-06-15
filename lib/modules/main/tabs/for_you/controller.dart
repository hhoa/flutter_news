import 'package:flutter/material.dart';
import 'package:flutter_news/biz/constants.dart';
import 'package:flutter_news/common/utils/utils.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ForYouController extends GetxController
    with SingleGetTickerProviderMixin {
  late List<Tab> tabs;
  late TabController tabController;
  List<String> queryString = ["bitcoin", "apple", "earthquake", "animal"];

  @override
  void onInit() {
    super.onInit();

    tabs = queryString.map((e) => Tab(text: e)).toList();

    int initialIndex = 0;
    String? pref = GetStorage().read(Constants.USER_PREFERENCE_KEY);
    if (isNotEmpty(pref)) {
      for (int i = 0; i < queryString.length; i++) {
        if (queryString[i] == pref) {
          initialIndex = i;
          break;
        }
      }
    }

    tabController = TabController(
        length: tabs.length, vsync: this, initialIndex: initialIndex);
    tabController.addListener(() {
      if (!tabController.indexIsChanging) {
        GetStorage().write(
            Constants.USER_PREFERENCE_KEY, queryString[tabController.index]);
      }
    });
  }
}
