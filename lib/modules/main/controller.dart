import 'package:flutter/material.dart';
import 'package:flutter_news/language/string_manager.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  late List<BottomBarItem> bottomNavBarItems;
  RxInt currentTabIndex = 0.obs;

  @override
  void onInit() async {
    super.onInit();
    bottomNavBarItems = [
      BottomBarItem(title: StringManager.forYou.tr, icon: Icons.favorite),
      BottomBarItem(title: StringManager.headline.tr, icon: Icons.public),
      BottomBarItem(title: StringManager.account.tr, icon: Icons.account_circle),
    ];
  }

  void onItemTapped(int value) {
    currentTabIndex.value = value;
  }
}

class BottomBarItem {
  String title;
  IconData icon;

  BottomBarItem({required this.title, required this.icon});
}