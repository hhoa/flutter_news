import 'package:flutter/material.dart';
import 'package:flutter_news/modules/main/controller.dart';
import 'package:get/get.dart';

import 'tabs/account/page.dart';
import 'tabs/for_you/page.dart';
import 'tabs/headlines/page.dart';

class MainPage extends GetView<MainController> {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: controller.bottomNavBarItems
              .map((BottomBarItem item) => BottomNavigationBarItem(
                    icon: Icon(
                      item.icon,
                      size: 24,
                    ),
                    label: item.title,
                  ))
              .toList(),
          type: BottomNavigationBarType.fixed,
          onTap: controller.onItemTapped,
          currentIndex: controller.currentTabIndex.value,
          iconSize: 24,
        ),
        body: getCurrentWidget(),
      ),
    );
  }

  Widget getCurrentWidget() {
    switch (controller.currentTabIndex.value) {
      case 0:
        return ForYouPage();
      case 1:
        return HeadlinePage();
      case 2:
        return AccountPage();
      default:
        return Container(
          child:
              Center(child: Text("index ${controller.currentTabIndex.value}")),
        );
    }
  }
}
