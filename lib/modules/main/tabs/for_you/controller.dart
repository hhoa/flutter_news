import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForYouController extends GetxController with SingleGetTickerProviderMixin {
  late List<Tab> tabs;
  late TabController tabController;
  List<String> queryString = ["bitcoin", "apple", "earthquake", "animal"];

  @override
  void onInit() {
    super.onInit();

    tabs = queryString.map((e) => Tab(text: e)).toList();

    tabController = TabController(length: tabs.length, vsync: this);
  }
}
